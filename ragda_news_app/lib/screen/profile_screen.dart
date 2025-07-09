import 'package:flutter/material.dart';
import 'package:ragda_news_app/widgets/profile_content.dart';
import 'package:ragda_news_app/widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF6BB6FF),
      body: Column(
        children: [
          ProfileHeader(
            name: 'Hasan Waulat',
            department: 'Departemen A',
          ),
          ProfileContent(),
        ],
      ),
    );
  }
}
