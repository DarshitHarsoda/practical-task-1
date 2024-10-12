import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_task_1/apiService/api_service.dart';
import 'package:practical_task_1/commonWidget/app_toast.dart';
import 'package:practical_task_1/model/contact_detail_model.dart';

class DetailsController extends GetxController {
  bool isLoading = true;
  DetailData? contactDetail;
  String token = '';
  String id = '';
  BuildContext? context;

  DetailsController(
      {required String usertoken,
      required String contactId,
      required BuildContext buildContext}) {
    token = usertoken;
    context = buildContext;
    id = contactId;
  }

  contactDetailsRequest(
      {required String token,
      required String id,
      required BuildContext context}) async {
    isLoading = true;
    update();
    debugPrint("API -- Token----->$token");
    debugPrint("API -- Id----->$id");

    await ApiService()
        .contactDetailsRequest(token: token, id: id)
        .then((response) {
      if (response.status == true) {
        contactDetail = response.data!;
      } else {
        AppToast.showError(
            context: context, error: response.message.toString());
      }
      isLoading = false;
      update();
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      debugPrint(error.toString());
      AppToast.showError(context: context, error: error.toString());
    });
  }

  @override
  void onInit() {
    contactDetailsRequest(id: id, token: token, context: context!);
    super.onInit();
  }
}
