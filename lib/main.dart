import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:practical_task_1/apiService/api_service.dart';
import 'package:practical_task_1/constants/app_color.dart';
import 'package:practical_task_1/route/router_config.dart';

void main() {
  ApiService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: GetMaterialApp.router(
        title: 'PracticalTask',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: AppColor.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          useMaterial3: true,
        ),
        routeInformationParser: AppRouterConfig.router.routeInformationParser,
        routeInformationProvider:
            AppRouterConfig.router.routeInformationProvider,
        routerDelegate: AppRouterConfig.router.routerDelegate,
      ),
    );
  }
}
