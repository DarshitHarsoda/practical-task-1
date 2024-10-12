import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:practical_task_1/apiService/api_service.dart';
import 'package:practical_task_1/commonWidget/app_toast.dart';
import 'package:practical_task_1/pages/homeScreen/controller/home_controller.dart';
import 'package:practical_task_1/route/router_constant.dart';

class AddDataController extends GetxController {
  TextEditingController mobileTextController = TextEditingController();
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  addContactRequest(
      {required Map<String, dynamic> parms,
      required String token,
      required BuildContext context}) async {
    isLoading = true;
    update();
    debugPrint("API -- addContactRequest----->$parms");

    await ApiService()
        .addContactRequest(parms: parms, bearerToken: token)
        .then((responce) {
      if (responce.status == true) {
        HomeController controller =
            Get.put(HomeController(usertoken: token, buildContext: context));
        controller.contactListRequest(token: token, context: context);
        context.goNamed(RouterConstant.homeScreen, extra: {'token': token});
      } else {
        AppToast.showError(
            context: context, error: responce.message.toString());
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
}
