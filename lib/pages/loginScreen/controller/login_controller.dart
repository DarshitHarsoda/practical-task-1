// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:practical_task_1/apiService/api_service.dart';
import 'package:practical_task_1/commonWidget/app_toast.dart';
import 'package:practical_task_1/route/router_constant.dart';

class LoginController extends GetxController {
  TextEditingController mobileTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isLoading = false;

  void onPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  loginRequest(
      {required Map<String, String> parms,
      required BuildContext context}) async {
    isLoading = true;
    update();
    debugPrint("API -- LoginRequest----->$parms");

    await ApiService().loginRequest(parms: parms).then((responce) {
      if (responce.status == true) {
        context.goNamed(RouterConstant.homeScreen,
            extra: {'token': responce.token});
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
