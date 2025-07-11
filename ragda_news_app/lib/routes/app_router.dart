import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/controllers/login_controller.dart';
import 'package:ragda_news_app/controllers/main_controller.dart';
import 'package:ragda_news_app/controllers/news_controller.dart';
import 'package:ragda_news_app/routes/app_routes.dart';
import 'package:ragda_news_app/screen/dashboard_screen.dart';
import 'package:ragda_news_app/screen/detail_news_screen.dart';
import 'package:ragda_news_app/screen/login_screen.dart';
import 'package:ragda_news_app/screen/main_screen.dart';
import 'package:ragda_news_app/screen/news_screen.dart';
import 'package:ragda_news_app/screen/profile_screen.dart';
import 'package:ragda_news_app/screen/splash_screen.dart';

class AppRouter {
  static final pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: AppRoutes.loginScreen,
        page: () => const LoginScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut<LoginController>(() => LoginController());
        })),
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => const MainScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<MainController>(() => MainController());
        Get.lazyPut<NewsController>(() => NewsController());
      }),
    ),
    GetPage(
      name: AppRoutes.detailNewsScreen,
      page: () => const DetailNewsScreen(),
    ),
  ];

  static Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoutes.dashboardScreen) {
      return GetPageRoute(
        settings: settings,
        routeName: AppRoutes.dashboardScreen,
        page: () => const DashboarScreen(),
        transition: Transition.noTransition,
      );
    }
    if (settings.name == AppRoutes.newsScreen) {
      return GetPageRoute(
        settings: settings,
        routeName: AppRoutes.newsScreen,
        page: () => const NewsScreen(),
        transition: Transition.noTransition,
      );
    }
    if (settings.name == AppRoutes.profileScreen) {
      return GetPageRoute(
        settings: settings,
        routeName: AppRoutes.profileScreen,
        page: () => const ProfileScreen(),
        transition: Transition.noTransition,
      );
    }
    return null;
  }
}
