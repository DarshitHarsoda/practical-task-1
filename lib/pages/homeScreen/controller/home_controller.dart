// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_task_1/apiService/api_service.dart';
import 'package:practical_task_1/commonWidget/app_toast.dart';
import 'package:practical_task_1/model/contact_list_model.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  List<ContactData> contactList = [];
  String token = '';
  BuildContext? context;
  List<ContactData> displayedContactList = [];
  int currentPage = 0;
  final int itemsPerPage = 10;

  HomeController(
      {required String usertoken, required BuildContext buildContext}) {
    token = usertoken;
    context = buildContext;
  }

  void loadMoreData() {
    int nextPage = currentPage + 1;
    int startIndex = currentPage * itemsPerPage;
    int endIndex = nextPage * itemsPerPage;

    // Ensure we don't exceed the length of contactList
    if (startIndex < contactList.length) {
      // Adjust endIndex if it exceeds the length of contactList
      if (endIndex > contactList.length) {
        endIndex = contactList.length;
      }

      displayedContactList.addAll(contactList.sublist(startIndex, endIndex));
      currentPage = nextPage;
      update();
    }
  }

  contactListRequest(
      {required String token, required BuildContext context}) async {
    isLoading = true;
    update();
    debugPrint("API -- Token----->$token");

    await ApiService().contactListRequest(token: token).then((response) {
      if (response.status == true) {
        contactList.clear();
        contactList.addAll(response.data!);
        loadMoreData();
        isLoading = false;
        update();
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
    contactListRequest(token: token, context: context!);

    super.onInit();
  }
}
