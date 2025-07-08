import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/routes/app_routes.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var currentIndexMain = 0.obs;

  final pages = <String>[
    AppRoutes.dashboardScreen,
    AppRoutes.newsScreen,
    AppRoutes.profileScreen,
  ];

  void changePage(int index) {
    currentIndexMain.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
