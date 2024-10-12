import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:practical_task_1/constants/app_color.dart';
import 'package:practical_task_1/constants/app_style.dart';

class CommonButton extends StatelessWidget {
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? elavation;
  final double? iconWidth;
  final double? iconHeight;
  final String buttonLable;
  final Color? backgroundColor;
  final Function onTap;
  final TextStyle? textStyle;
  final BoxDecoration? boxDecoration;
  final String? icon;
  final double? iconTextPadding;
  final bool isLoading;

  const CommonButton(
      {super.key,
      this.borderRadius,
      this.height,
      this.width,
      this.isLoading = false,
      required this.buttonLable,
      this.backgroundColor,
      this.icon,
      this.iconHeight,
      this.iconWidth,
      this.boxDecoration,
      this.elavation,
      this.iconTextPadding,
      required this.onTap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      decoration: boxDecoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
              )
            ],
          ),
      child: ElevatedButton(
        onPressed: () {
          isLoading ? null : onTap();
        },
        style: ElevatedButton.styleFrom(
          elevation: elavation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
          ),
          backgroundColor: backgroundColor ?? AppColor.primaryColor,
          minimumSize: Size(width ?? double.infinity, height ?? 50.h),
          maximumSize: Size(width ?? double.infinity, height ?? 50.h),
          padding: EdgeInsets.zero,
          splashFactory: NoSplash.splashFactory,
        ),
        child: isLoading
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.fourRotatingDots(
                    size: 24,
                    color: AppColor.white,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Please Wait...',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyle.buttonTextStyle.copyWith(),
                      ),
                    ),
                  ),
                ],
              )
            : icon != null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: iconTextPadding ?? 10),
                        child: SvgPicture.asset(
                          icon!,
                          height: iconHeight ?? 22.h,
                          width: iconWidth ?? 22.h,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: Platform.isIOS ? 1.h : 0.h),
                        child: Text(
                          buttonLable,
                          style:
                              textStyle ?? AppStyle.buttonTextStyle.copyWith(),
                        ),
                      ),
                    ],
                  )
                : Text(
                    buttonLable,
                    style: textStyle ?? AppStyle.buttonTextStyle.copyWith(),
                  ),
      ),
    );
  }
}
