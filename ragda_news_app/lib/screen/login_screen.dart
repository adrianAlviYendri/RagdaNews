import 'package:flutter/material.dart';
import 'package:ragda_news_app/widgets/login_header.dart';
import 'package:ragda_news_app/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          LoginHeader(),
          LoginForm(),
        ],
      ),
    );
  }
}
