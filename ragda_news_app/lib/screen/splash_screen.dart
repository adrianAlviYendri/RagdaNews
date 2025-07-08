import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 6), () => Get.toNamed(AppRoutes.loginScreen));
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "RAGDANews",
          style: TextStyle(
              fontSize: 29, fontWeight: FontWeight.w900, color: Colors.blue),
        ),
      ),
    );
  }
}
