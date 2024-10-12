import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practical_task_1/constants/app_color.dart';

class AppStyle {
  static TextStyle appbarTitleTextStyle = TextStyle(
      color: AppColor.grey1,
      fontSize: 18.sp,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w500);

  static TextStyle labelTextStyle = TextStyle(
      color: AppColor.grey1,
      fontSize: 14.sp,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w400);

  static TextStyle textFieldTextStyle = TextStyle(
      color: AppColor.grey1,
      fontSize: 14.sp,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w400);

  static TextStyle hintTextStyle = TextStyle(
      color: AppColor.hintColor,
      fontSize: 14.sp,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w400);

  static TextStyle fieldErrorStyle = TextStyle(
      color: AppColor.redColor,
      fontSize: 12.sp,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w400);

  static TextStyle buttonTextStyle = TextStyle(
      color: AppColor.white,
      fontSize: 14.sp,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w600);

  static TextStyle titleTextStyle = TextStyle(
      color: AppColor.grey1,
      fontSize: 16.sp,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w500);

  static TextStyle itemTitleTextStyle = TextStyle(
      color: AppColor.grey1,
      fontSize: 14.sp,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w500);

  static TextStyle itemValueTextStyle = TextStyle(
      color: AppColor.grey1,
      fontSize: 14.sp,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w300);
}
