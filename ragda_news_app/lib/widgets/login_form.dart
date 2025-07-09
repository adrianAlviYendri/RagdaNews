// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/controllers/login_controller.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  static const Color _errorColor = Color(0xFFFF5252);
  static const Color _normalBorderColor = Color(0xFFE0E0E0);
  static const Color _normalIconColor = Color(0xFF888888);
  static const Color _primaryColor = Color(0xFF6BB6FF);
  static const Color _normalTextColor = Color(0xFF333333);

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<LoginController>()) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }

    return Expanded(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmailField(),
            _buildErrorMessage(controller.emailError),
            _buildGeneralErrorBanner(),
            const SizedBox(height: 20),
            _buildPasswordField(),
            _buildErrorMessage(controller.passwordError),
            const SizedBox(height: 12),
            _buildForgotPasswordButton(),
            const SizedBox(height: 24),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333))),
        const SizedBox(height: 8),
        _buildTextField(
          controller: controller.emailController,
          focusNode: controller.emailFocusNode,
          hintText: 'Cth. contoh@gmail.com',
          prefixIcon: Icons.person_outline,
          errorStream: controller.emailError,
          onSubmitted: controller.onEmailSubmitted,
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333))),
        const SizedBox(height: 8),
        _buildTextField(
          controller: controller.passwordController,
          focusNode: controller.passwordFocusNode,
          hintText: 'Enter password',
          prefixIcon: Icons.lock_outline,
          errorStream: controller.passwordError,
          isPassword: true,
          onSubmitted: controller.onPasswordSubmitted,
        ),
      ],
    );
  }

  Widget _buildErrorMessage(RxString errorStream) {
    return Obx(() => errorStream.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(errorStream.value,
                style: const TextStyle(color: _errorColor, fontSize: 14)),
          )
        : const SizedBox.shrink());
  }

  Widget _buildGeneralErrorBanner() {
    return Obx(() => controller.generalError.isNotEmpty
        ? Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: _errorColor, borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    controller.generalError.value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink());
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text('Forgot Password?',
            style: TextStyle(color: Color(0xFFFF6B6B), fontSize: 14)),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: controller.onLoginPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: const Text('Enter',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
    required IconData prefixIcon,
    required RxString errorStream,
    bool isPassword = false,
    Function(String)? onSubmitted,
  }) {
    return Obx(() {
      final hasError =
          errorStream.isNotEmpty || this.controller.generalError.isNotEmpty;

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: hasError ? _errorColor : _normalBorderColor, width: 1.5),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          obscureText:
              isPassword ? this.controller.obscurePassword.value : false,
          textInputAction:
              isPassword ? TextInputAction.done : TextInputAction.next,
          onSubmitted: onSubmitted,
          style: TextStyle(
            color: hasError ? _errorColor : _normalTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon,
                color: hasError ? _errorColor : _normalIconColor),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      this.controller.obscurePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: hasError ? _errorColor : _normalIconColor,
                    ),
                    onPressed: this.controller.togglePasswordVisibility,
                  )
                : null,
            hintText: hintText,
            hintStyle: const TextStyle(color: _normalIconColor, fontSize: 14),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      );
    });
  }
}
