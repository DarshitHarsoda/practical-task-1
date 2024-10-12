import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practical_task_1/pages/addDataScreen/add_data_screen.dart';
import 'package:practical_task_1/pages/detailsScreen/details__screen.dart';
import 'package:practical_task_1/pages/homeScreen/home_screen.dart';
import 'package:practical_task_1/pages/loginScreen/login_screen.dart';
import 'package:practical_task_1/route/router_constant.dart';

class AppRouterConfig {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: RouterConstant.loginScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: '/homeScreen',
        name: RouterConstant.homeScreen,
        pageBuilder: (context, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};

          return MaterialPage(
            child: HomeScreen(token: data['token']),
          );
        },
      ),
      GoRoute(
        path: '/detailsScreen',
        name: RouterConstant.detailsScreen,
        pageBuilder: (context, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};
          return MaterialPage(
            child: DetailsScreen(
              token: data['token'],
              id: data['id'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/addDataScreen',
        name: RouterConstant.addDataScreen,
        pageBuilder: (context, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};

          return MaterialPage(
            child: AddDataScreen(
              token: data['token'],
            ),
          );
        },
      ),
    ],
  );
}
