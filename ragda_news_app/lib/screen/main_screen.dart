import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/controllers/main_controller.dart';
import 'package:ragda_news_app/routes/app_router.dart';
import 'package:ragda_news_app/routes/app_routes.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: AppRoutes.dashboardScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.shade600,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          onTap: (index) {
            controller.changePage(index);
          },
          currentIndex: controller.currentIndexMain.value,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home_filled,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: 'News',
              icon: Icon(
                Icons.newspaper,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.person,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
