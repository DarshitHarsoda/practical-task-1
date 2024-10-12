import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as DioApi;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:practical_task_1/apiService/api_endpoints.dart';
import 'package:practical_task_1/model/add_contact_model.dart';
import 'package:practical_task_1/model/contact_detail_model.dart';
import 'package:practical_task_1/model/contact_list_model.dart';
import 'package:practical_task_1/model/login_model.dart';

class ApiService {
  static late Dio _dio;
  static late DioCacheManager _dioCacheManager;
  static void init() async {
    try {
      var options = DioApi.BaseOptions(
          baseUrl: ApiEndpoint.BASE_URL,
          followRedirects: false,
          connectTimeout: 500000,
          validateStatus: (status) {
            return status! < 400;
          });

      _dio = Dio(options);

      if (kDebugMode) {
        _dio.interceptors.add(LogInterceptor(
            responseBody: true,
            error: true,
            requestHeader: false,
            responseHeader: false,
            request: false,
            requestBody: true));
      }
    } catch (e) {
      // print(e);
    }
  }

  static Future<dynamic> postRequest({
    bool isHeaderIncluded = false,
    bool isMultipart = false,
    bool isAcceptJson = false,
    endpoint,
    bool showNoInternet = false,
    String? bearerToken,
    data = const {"": ""},
  }) async {
    try {
      if (kDebugMode) {
        print("API DATA-->--------------------");
        print("API DATA-->REQUEST TYPE : POST ");
        print("API DATA-->REQUEST END POINT : $endpoint");
        print("API DATA-->REQUEST DATA : $data");
      }
      if (isHeaderIncluded) {
        _dio.options.headers["Authorization"] = 'Bearer $bearerToken';
        _dio.options.headers["Content-Type"] =
            "application/x-www-form-urlencoded";
        _dio.options.headers["x-access-token"] = '';
      } else {
        _dio.options.headers["Accept"] = "application/json";
      }
      if (isMultipart) {
        _dio.options.contentType = 'multipart/form-data';
      }

      DioApi.Response response = await _dio.post(
        endpoint,
        data: data,
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 400) {
        return response;
      } else {
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } on DioError catch (err) {
      if (err.response != null && err.response?.data != null) {
        String errorMessage =
            err.response!.data['message'] ?? 'Something went wrong';
        throw Exception(errorMessage);
      } else {
        throw Exception('Failed to make request: ${err.message}');
      }
    }
  }

  static Future<Response> getRequest({token, endpoint, param}) async {
    try {
      if (kDebugMode) {
        print("API DATA-->--------------------");
        print("API DATA-->REQUEST TYPE : GET ");
        print("API DATA-->REQUEST END POINT : $endpoint");
        print("API DATA-->REQUEST DATA : $param");
      }
      _dioCacheManager = DioCacheManager(CacheConfig(baseUrl: endpoint));
      _dio.interceptors.add(_dioCacheManager.interceptor);
      Options options = Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
        extra: buildCacheOptions(const Duration(days: 7),
                forceRefresh: true, primaryKey: endpoint)
            .extra,
      );
      Response response =
          await _dio.get(endpoint, queryParameters: param, options: options);
      if (response.statusCode == 200) {
        return response;
      }

      return response;
    } on DioError catch (err) {
      if (err.response != null && err.response?.data != null) {
        String errorMessage =
            err.response!.data['message'] ?? 'Something went wrong';
        throw Exception(errorMessage);
      } else {
        throw Exception('Failed to make request: ${err.message}');
      }
    }
  }

//LoginRequest
  Future<LoginModel> loginRequest({required Map<String, String>? parms}) async {
    final response = await postRequest(
      endpoint: ApiEndpoint.loginUrl,
      data: parms,
    );
    if (response.statusCode == 505) {
    } else if (response.statusCode == 400) {
      Map<String, dynamic> data = jsonDecode(response.data.toString());
      throw data['message'];
    } else if (response.statusCode != 200) {
      Map<String, dynamic> data = jsonDecode(response.data.toString());
      throw data['message'];
    }
    return LoginModel.fromJson(response.data);
  }

//contactRequest
  Future<ContactListModel> contactListRequest({required String token}) async {
    final response = await getRequest(
      token: token,
      endpoint: ApiEndpoint.contactListUrl,
    );

    debugPrint("API -- Token>$token");
    if (response.statusCode == 505) {
    } else if (response.statusCode == 400) {
      Map<String, dynamic> data = jsonDecode(response.data.toString());
      throw data['message'];
    } else if (response.statusCode != 200) {
      Map<String, dynamic> data = jsonDecode(response.data.toString());
      throw data['message'];
    }
    return ContactListModel.fromJson(response.data);
  }

//ContactDetailsRequest
  Future<ContactDetailModel> contactDetailsRequest(
      {required String token, required String id}) async {
    final response = await getRequest(
      token: token,
      endpoint: '${ApiEndpoint.contactListUrl}/$id',
    );

    debugPrint("API -- Token-->$token");
    debugPrint("API -- Id-->$id");

    if (response.statusCode == 505) {
    } else if (response.statusCode == 400) {
      Map<String, dynamic> data = jsonDecode(response.data.toString());
      throw data['message'];
    } else if (response.statusCode != 200) {
      Map<String, dynamic> data = jsonDecode(response.data.toString());
      throw data['message'];
    }
    return ContactDetailModel.fromJson(response.data);
  }

// AddContactModel
  Future<AddContactModel> addContactRequest(
      {required Map<String, dynamic>? parms,
      required String bearerToken}) async {
    final response = await postRequest(
      endpoint: ApiEndpoint.contactListUrl,
      data: parms,
      isHeaderIncluded: true,
      bearerToken: bearerToken,
    );
    if (response.statusCode == 505) {
    } else if (response.statusCode == 400) {
      Map<String, dynamic> data = jsonDecode(response.data.toString());
      throw data['message'];
    } else if (response.statusCode != 200) {
      Map<String, dynamic> data = jsonDecode(response.data.toString());
      throw data['message'];
    }
    return AddContactModel.fromJson(response.data);
  }
}
