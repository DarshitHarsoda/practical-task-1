import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:practical_task_1/commonWidget/common_appbar.dart';
import 'package:practical_task_1/constants/app_color.dart';
import 'package:practical_task_1/constants/app_string.dart';
import 'package:practical_task_1/constants/app_style.dart';
import 'package:practical_task_1/pages/homeScreen/controller/home_controller.dart';
import 'package:practical_task_1/pages/homeScreen/item_contact_list.dart';
import 'package:practical_task_1/route/router_constant.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  final String token;
  const HomeScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(usertoken: token, buildContext: context),
      builder: (controller) {
        return Scaffold(
          appBar: CommonAppBarWidget(
            backbtn: false,
            title:
                Text(AppString.contacts, style: AppStyle.appbarTitleTextStyle),
          ),
          floatingActionButton: InkWell(
            onTap: () {
              context.pushNamed(
                RouterConstant.addDataScreen,
                extra: {'token': token},
              );
            },
            child: Container(
              width: 70.w,
              height: 70.h,
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor.withOpacity(0.2),
              ),
              child: Container(
                padding: EdgeInsets.all(10.w),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primaryColor,
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
          body: controller.isLoading
              ? ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.all(20.w),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.r)),
                          height: 150.0,
                        ),
                      ),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: controller.displayedContactList.length + 1,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(20.w),
                  itemBuilder: (context, index) {
                    return index < controller.displayedContactList.length
                        ? InkWell(
                            onTap: () {
                              context.pushNamed(RouterConstant.detailsScreen,
                                  extra: {
                                    'token': token,
                                    'id': controller.contactList[index].id
                                  });
                            },
                            child: ItemContactList(
                              contactList: controller.contactList[index],
                            ),
                          )
                        : controller.displayedContactList.length <
                                controller.contactList.length
                            ? InkWell(
                                onTap: () {
                                  controller.loadMoreData();
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.h, bottom: 50.h),
                                  child: Center(
                                    child: Text(
                                      'Load More',
                                      style: AppStyle.appbarTitleTextStyle,
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    EdgeInsets.only(top: 20.h, bottom: 50.h),
                                child: Center(
                                  child: Text(
                                    'No More Data',
                                    style: AppStyle.hintTextStyle,
                                  ),
                                ),
                              );
                  },
                ),
        );
      },
    );
  }
}
