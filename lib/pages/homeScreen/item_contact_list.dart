import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practical_task_1/constants/app_string.dart';
import 'package:practical_task_1/constants/app_style.dart';
import 'package:practical_task_1/model/contact_list_model.dart';

class ItemContactList extends StatelessWidget {
  final ContactData contactList;
  const ItemContactList({super.key, required this.contactList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      margin: EdgeInsets.only(bottom: 10.h),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
//FirstLast
          itemData(
              title: AppString.firstName,
              value: contactList.firstName ?? "No data found"),
          SizedBox(
            height: 10.h,
          ),
//LastName
          itemData(
              title: AppString.lastName,
              value: contactList.lastName ?? 'No data found'),
          SizedBox(
            height: 10.h,
          ),
//Email

          itemData(
              title: AppString.email,
              value: contactList.email ?? "No data found"),
          SizedBox(
            height: 10.h,
          ),
//Mobile
          itemData(
              title: AppString.mobile,
              value: contactList.mobile ?? "No data found"),
        ],
      ),
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
