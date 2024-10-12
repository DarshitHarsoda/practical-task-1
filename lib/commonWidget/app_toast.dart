import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class AppToast {
  static showError(
      {required BuildContext context,
      required String error,
      String? title,
      Widget? iconIgonered}) {
    showToastWidget(LayoutBuilder(builder: (context, c) {
      return Padding(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Material(
          color: Colors.white,
          elevation: 10.0,
          shadowColor: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(5),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      decoration: const BoxDecoration(color: Colors.red),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: iconIgonered ??
                          const Icon(Icons.cancel_rounded,
                              color: Colors.red, size: 25),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title ?? 'Error',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              error,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      ToastManager().dismissAll();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }),
        context: context,
        animation: StyledToastAnimation.slideFromTop,
        reverseAnimation: StyledToastAnimation.slideFromTop,
        position: StyledToastPosition.top,
        isIgnoring: false);
  }
}
