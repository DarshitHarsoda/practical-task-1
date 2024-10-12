import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practical_task_1/commonWidget/common_appbar.dart';
import 'package:practical_task_1/constants/app_string.dart';
import 'package:practical_task_1/constants/app_style.dart';
import 'package:practical_task_1/pages/detailsScreen/controller/details_controller.dart';
import 'package:shimmer/shimmer.dart';

class DetailsScreen extends StatelessWidget {
  final String token;
  final String id;
  const DetailsScreen({super.key, required this.token, required this.id});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      init: DetailsController(
          usertoken: token, contactId: id, buildContext: context),
      builder: (controller) {
        return Scaffold(
          appBar: CommonAppBarWidget(
            title: Text(AppString.contactDetail,
                style: AppStyle.appbarTitleTextStyle),
          ),
          body: controller.isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.r)),
                    height: 300.h,
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(20.h),
                  margin: EdgeInsets.all(20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 4),
                        blurRadius: 50,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
//Id

                      itemData(
                          title: AppString.id,
                          value:
                              controller.contactDetail!.id ?? "No data found"),
                      SizedBox(
                        height: 10.h,
                      ),
//FirstName
                      itemData(
                          title: AppString.firstName,
                          value: controller.contactDetail!.firstName ??
                              "No data found"),
                      SizedBox(
                        height: 10.h,
                      ),

//LastName
                      itemData(
                          title: AppString.lastName,
                          value: controller.contactDetail!.lastName ??
                              'No data found'),
                      SizedBox(
                        height: 10.h,
                      ),
//Email

                      itemData(
                          title: AppString.email,
                          value: controller.contactDetail!.email ??
                              "No data found"),
                      SizedBox(
                        height: 10.h,
                      ),
//Mobile
                      itemData(
                          title: AppString.mobile,
                          value: controller.contactDetail!.mobile ??
                              "No data found"),
                      SizedBox(
                        height: 10.h,
                      ),
//Address
                      itemData(
                          title: AppString.address,
                          value: controller.contactDetail!.addresses!.isEmpty
                              ? "No data found"
                              : '${controller.contactDetail!.addresses![0].addressLine1}\n${controller.contactDetail!.addresses![0].addressLine2}'),
                      SizedBox(
                        height: 10.h,
                      ),
// //LandMark
                      itemData(
                          title: AppString.landMark,
                          value: controller.contactDetail!.addresses!.isEmpty
                              ? "No data found"
                              : controller.contactDetail!.addresses![0].landmark
                                  .toString()),
                      SizedBox(
                        height: 10.h,
                      ),
// //Pincode
                      itemData(
                          title: AppString.pincode,
                          value: controller.contactDetail!.addresses!.isEmpty
                              ? "No data found"
                              : controller.contactDetail!.addresses![0].pincode
                                  .toString()),
                      SizedBox(
                        height: 10.h,
                      ),
// //City
                      itemData(
                          title: AppString.city,
                          value: controller.contactDetail!.addresses!.isEmpty
                              ? "No data found"
                              : controller.contactDetail!.addresses![0].city
                                  .toString()),
                      SizedBox(
                        height: 10.h,
                      ),

// //Country

                      itemData(
                          title: AppString.country,
                          value: controller.contactDetail!.addresses!.isEmpty
                              ? "No data found"
                              : controller
                                  .contactDetail!.addresses![0].countryName
                                  .toString()),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget itemData({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyle.itemTitleTextStyle),
        Text(value, style: AppStyle.itemValueTextStyle)
      ],
    );
  }
}
