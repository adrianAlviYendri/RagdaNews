import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/widgets/profile_menu_item.dart';
import 'package:ragda_news_app/widgets/logout_dialog.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Account Settings'),
              const SizedBox(height: 24),
              _buildAccountMenuItems(),
              const SizedBox(height: 32),
              _buildSectionTitle('Other'),
              const SizedBox(height: 24),
              _buildLogoutMenuItem(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF666666),
      ),
    );
  }

  Widget _buildAccountMenuItems() {
    return Column(
      children: [
        ProfileMenuItem(
          icon: Icons.person_outline,
          title: 'Personal Information',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.lock_outline,
          title: 'Password & Security',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.attach_money_outlined,
          title: 'Salary Slip Summary',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.calendar_today_outlined,
          title: 'Leave Summary',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.access_time_outlined,
          title: 'Overtime Summary',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.description_outlined,
          title: 'Annual Tax Return PPH21',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildLogoutMenuItem() {
    return ProfileMenuItem(
      icon: Icons.logout_outlined,
      title: 'Logout',
      onTap: () {
        Get.dialog(const LogoutDialog(), barrierDismissible: true);
      },
      isLogout: true,
    );
  }
}
