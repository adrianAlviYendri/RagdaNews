import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/routes/app_routes.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLogoutIcon(),
            const SizedBox(height: 24),
            _buildTitle(),
            const SizedBox(height: 12),
            _buildSubtitle(),
            const SizedBox(height: 32),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6BB6FF), Color(0xFF4A90E2)],
        ),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.logout_outlined, size: 40, color: Colors.white),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Logout?',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
    );
  }

  Widget _buildSubtitle() {
    return const Text(
      'Are you sure you want to logout?',
      style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 255, 15, 15)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed(AppRoutes.loginScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 15, 15),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
