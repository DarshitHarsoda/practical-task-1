import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:practical_task_1/commonWidget/common_appbar.dart';
import 'package:practical_task_1/commonWidget/common_button.dart';
import 'package:practical_task_1/commonWidget/common_textform_field.dart';
import 'package:practical_task_1/constants/app_assets.dart';
import 'package:practical_task_1/constants/app_color.dart';
import 'package:practical_task_1/constants/app_string.dart';
import 'package:practical_task_1/constants/app_style.dart';
import 'package:practical_task_1/pages/loginScreen/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
            appBar: CommonAppBarWidget(
              backbtn: false,
              title:
                  Text(AppString.login, style: AppStyle.appbarTitleTextStyle),
            ),
            body: Form(
              key: controller.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//MobileNumber
                    Text(AppString.mobileNumber,
                        style: AppStyle.labelTextStyle),
                    SizedBox(
                      height: 12.h,
                    ),
//EnterMobileNumber
                    CommonTextFormField(
                      textEditingController: controller.mobileTextController,
                      paddingVertical: 18.h,
                      textInputType: TextInputType.phone,
                      prefixIcon: Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 10.w, top: 0.h),
                        child: Text(
                          '+91',
                          style: AppStyle.textFieldTextStyle,
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      hintText: AppString.mobileHint,
                      counterWidget: const SizedBox.shrink(),
                      maxLength: 10,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.mobileReqired;
                        }
                        if (value.length < 10) {
                          return AppString.validMobileNumber;
                        }
                        return null;
                      },
                      errorStyle: AppStyle.fieldErrorStyle,
                    ),

                    SizedBox(
                      height: 18.h,
                    ),

//Password
                    Text(AppString.password, style: AppStyle.labelTextStyle),
                    SizedBox(
                      height: 12.h,
                    ),
//EnterPassword
                    CommonTextFormField(
                      textEditingController: controller.passTextController,
                      hintText: AppString.passwordHint,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.passwordReqired;
                        }
                        return null;
                      },
                      errorStyle: AppStyle.fieldErrorStyle,
                      obscureText: controller.isPasswordVisible,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.onPasswordVisible();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 15.h),
                          child: SvgPicture.asset(
                            controller.isPasswordVisible
                                ? AppAssets.icPasswordVisible
                                : AppAssets.icPasswordInVisible,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),

//ForgetPass
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppString.forgotPassword,
                          style: AppStyle.labelTextStyle.copyWith(
                            color: AppColor.blueColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.blueColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

//Loginbutton
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(20.w),
              child: CommonButton(
                isLoading: controller.isLoading,
                buttonLable: AppString.login.toUpperCase(),
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.loginRequest(parms: {
                      'mobile': controller.mobileTextController.text,
                      'password': controller.passTextController.text
                    }, context: context);
                  }
                },
              ),
            ));
      },
    );
  }
}
