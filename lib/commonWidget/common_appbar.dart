import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';
import 'package:practical_task_1/constants/app_assets.dart';
import 'package:practical_task_1/constants/app_color.dart';

class CommonAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget title;
  final Color bgColor;
  final bool backbtn;
  final void Function()? backOnPressed;
  final Color navigationBarColor;
  final bool bottomDivider;
  final Widget? backIcon;
  final Color systemNavigationBarDividerColor;
  final Color statusBarColor;
  final double? leadingWidth;
  final List<Widget>? actions;
  static final double _systemNavigationBarHeight = 55.h;

  const CommonAppBarWidget({
    super.key,
    this.title = const SizedBox.shrink(),
    this.bgColor = AppColor.white,
    this.backbtn = true,
    this.navigationBarColor = AppColor.white,
    this.actions,
    this.backIcon,
    this.bottomDivider = false,
    this.systemNavigationBarDividerColor = AppColor.white,
    this.backOnPressed,
    this.statusBarColor = AppColor.white,
    this.leadingWidth,
  });

  @override
  Size get preferredSize => Size.fromHeight(_systemNavigationBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: navigationBarColor,
          statusBarBrightness: Brightness.light,
          statusBarColor: statusBarColor,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: systemNavigationBarDividerColor,
          statusBarIconBrightness: Brightness.light),
      scrolledUnderElevation: 0,
      titleSpacing: 0.0,
      shape: bottomDivider == true
          ? Border(
              bottom: BorderSide(
                color: AppColor.black.withOpacity(0.50),
                width: 1.w,
              ),
            )
          : null,
      automaticallyImplyLeading: backbtn,
      backgroundColor: bgColor,
      actions: actions,
      centerTitle: false,
      leading: backbtn
          ? backIcon ??
              IconButton(
                icon: SvgPicture.asset(
                  AppAssets.icBack,
                  height: 30.h,
                  width: 30.w,
                ),
                onPressed: backOnPressed ??
                    () {
                      context.pop();
                    },
              )
          : null,
      title: Padding(
          padding: EdgeInsets.only(left: !backbtn ? 22.w : 0.w), child: title),
    );
  }
}
