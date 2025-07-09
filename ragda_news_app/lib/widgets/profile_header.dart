import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String department;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.department,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6BB6FF), Color(0xFF4A90E2)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildProfileInfo(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 16),
        const Text(
          'Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return Row(
      children: [
        _buildAvatar(),
        const SizedBox(width: 16),
        _buildNameAndDepartment(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: ClipOval(
        child: Image.network(
          _generateAvatarUrl(name),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Icon(Icons.person, size: 40, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNameAndDepartment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          department,
          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  String _generateAvatarUrl(String name) {
    final encodedName = Uri.encodeComponent(name);
    return 'https://image.pollinations.ai/prompt/professional%20headshot%20portrait%20of%20$encodedName%20businessman%20corporate%20office%20worker%20clean%20background%20realistic%20photo';
  }
}