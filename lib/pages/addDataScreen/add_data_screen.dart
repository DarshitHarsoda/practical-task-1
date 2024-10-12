import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practical_task_1/commonWidget/common_appbar.dart';
import 'package:practical_task_1/commonWidget/common_button.dart';
import 'package:practical_task_1/commonWidget/common_textform_field.dart';
import 'package:practical_task_1/constants/app_string.dart';
import 'package:practical_task_1/constants/app_style.dart';
import 'package:practical_task_1/pages/addDataScreen/controller/add_data_controller.dart';

class AddDataScreen extends StatelessWidget {
  final String token;
  const AddDataScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddDataController>(
      init: AddDataController(),
      builder: (controller) {
        return Scaffold(
          appBar: CommonAppBarWidget(
            title: Text(AppString.addContact,
                style: AppStyle.appbarTitleTextStyle),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //FirstName
                    Text(AppString.firstName.toUpperCase(),
                        style: AppStyle.labelTextStyle),
                    SizedBox(
                      height: 12.h,
                    ),
                    CommonTextFormField(
                      textEditingController: controller.firstNameTextController,
                      hintText: AppString.firstNameHint,
                      textCapitalization: TextCapitalization.words,
                      paddingVertical: 17.w,
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.fnReqired;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),

                    //LastName
                    Text(AppString.lastName.toUpperCase(),
                        style: AppStyle.labelTextStyle),
                    SizedBox(
                      height: 12.h,
                    ),
                    CommonTextFormField(
                      textEditingController: controller.lastNameTextController,
                      hintText: AppString.lastNameHint,
                      paddingVertical: 17.w,
                      maxLines: 1,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.lnReqired;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),

                    //Mobile
                    Text('${AppString.mobileNumber.toUpperCase()} :',
                        style: AppStyle.labelTextStyle),
                    SizedBox(
                      height: 12.h,
                    ),
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
                    //Email

                    Text(AppString.email.toUpperCase(),
                        style: AppStyle.labelTextStyle),
                    SizedBox(
                      height: 12.h,
                    ),

                    CommonTextFormField(
                      textEditingController: controller.emailTextController,
                      hintText: AppString.emailHitnt,
                      paddingVertical: 17.w,
                      maxLines: 1,
                      validator: (value) {
                        if (validateEmail(value) != null) {
                          return validateEmail(value);
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

//Loginbutton
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.w),
            child: CommonButton(
              isLoading: controller.isLoading,
              buttonLable: AppString.addContact.toUpperCase(),
              onTap: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.addContactRequest(parms: {
                    'first_name':
                        controller.firstNameTextController.text.toString(),
                    'last_name':
                        controller.lastNameTextController.text.toString(),
                    'email': controller.emailTextController.text.toString(),
                    'mobile': controller.mobileTextController.text.toString(),
                    'profile': "",
                    'contact_types': [
                      {"id": "a1dd708a-3db5-11ef-9634-484520bf7692"},
                    ],
                    'addresses': [],
                  }, token: token, context: context);
                }
              },
            ),
          ),
        );
      },
    );
  }

  static String? validateEmail(String? value) {
    final RegExp emailRegex = RegExp(r'^[\w.]+@[\w.]+\.\w+$');
    if (value == null || value.isEmpty) {
      return AppString.emailReqired;
    }
    if (!emailRegex.hasMatch(value)) {
      return AppString.validemail;
    }
    return null;
  }
}
