import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/routes/app_routes.dart';

enum ValidationErrorType {
  none,
  emptyFields,
  emailNotRegistered,
  passwordTooShort,
  incorrectPassword,
}

class LoginController extends GetxController {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  FocusNode? _emailFocusNode;
  FocusNode? _passwordFocusNode;

  TextEditingController get emailController =>
      _emailController ??= TextEditingController();
  TextEditingController get passwordController =>
      _passwordController ??= TextEditingController();
  FocusNode get emailFocusNode => _emailFocusNode ??= FocusNode();
  FocusNode get passwordFocusNode => _passwordFocusNode ??= FocusNode();

  final RxBool obscurePassword = true.obs;
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxString generalError = ''.obs;
  final RxBool isFormValid = false.obs;

  static const String _validEmail = 'hasan@gmail.com';
  static const String _validPassword = 'Hasan17.';
  static const int _minPasswordLength = 8;

  bool _isDisposed = false;

  @override
  void onInit() {
    super.onInit();
    _setupListeners();
  }

  void _setupListeners() {
    emailController.addListener(_clearErrorsOnChange);
    passwordController.addListener(_clearErrorsOnChange);
  }

  @override
  void onClose() {
    _isDisposed = true;
    _cleanupResources();
    super.onClose();
  }

  void _cleanupResources() {
    try {
      if (_emailController != null) {
        _emailController!.removeListener(_clearErrorsOnChange);
        _emailController!.dispose();
        _emailController = null;
      }

      if (_passwordController != null) {
        _passwordController!.removeListener(_clearErrorsOnChange);
        _passwordController!.dispose();
        _passwordController = null;
      }

      if (_emailFocusNode != null) {
        _emailFocusNode!.dispose();
        _emailFocusNode = null;
      }

      if (_passwordFocusNode != null) {
        _passwordFocusNode!.dispose();
        _passwordFocusNode = null;
      }
    } catch (e) {
      print('Error during cleanup: $e');
    }
  }

  void _clearErrorsOnChange() {
    if (_isDisposed) return;

    if (emailError.isNotEmpty ||
        passwordError.isNotEmpty ||
        generalError.isNotEmpty) {
      _clearErrors();
    }
  }

  void validateForm() {
    if (_isDisposed) return;

    _clearErrors();

    final email = emailController.text.trim();
    final password = passwordController.text;

    final validationResult = _getValidationError(email, password);
    _handleValidationResult(validationResult);
  }

  ValidationErrorType _getValidationError(String email, String password) {
    if (email.isEmpty && password.isEmpty) {
      return ValidationErrorType.emptyFields;
    }

    if (email.isEmpty) {
      return ValidationErrorType.emptyFields;
    }

    if (password.isEmpty) {
      return ValidationErrorType.emptyFields;
    }

    if (email != _validEmail) {
      return ValidationErrorType.emailNotRegistered;
    }

    if (password.length < _minPasswordLength) {
      return ValidationErrorType.passwordTooShort;
    }

    if (password != _validPassword) {
      return ValidationErrorType.incorrectPassword;
    }

    return ValidationErrorType.none;
  }

  void _handleValidationResult(ValidationErrorType errorType) {
    if (_isDisposed) return;

    switch (errorType) {
      case ValidationErrorType.none:
        isFormValid.value = true;
        break;

      case ValidationErrorType.emptyFields:
        generalError.value = 'Please fill in all these fields';
        isFormValid.value = false;
        break;

      case ValidationErrorType.emailNotRegistered:
        emailError.value = 'Email not registered';
        isFormValid.value = false;
        break;

      case ValidationErrorType.passwordTooShort:
        passwordError.value =
            'The password must be $_minPasswordLength characters';
        isFormValid.value = false;
        break;

      case ValidationErrorType.incorrectPassword:
        passwordError.value = 'Incorrect password';
        isFormValid.value = false;
        break;
    }
  }

  void _clearErrors() {
    if (_isDisposed) return;

    emailError.value = '';
    passwordError.value = '';
    generalError.value = '';
  }

  void onLoginPressed() {
    if (_isDisposed) return;

    validateForm();

    if (isFormValid.value) {
      Get.toNamed(AppRoutes.mainScreen);
    }
  }

  void togglePasswordVisibility() {
    if (_isDisposed) return;

    obscurePassword.value = !obscurePassword.value;
  }

  void onEmailSubmitted(String value) {
    if (_isDisposed) return;

    validateForm();

    if (generalError.isEmpty) {
      if (Get.context != null &&
          _passwordFocusNode != null &&
          _passwordFocusNode!.canRequestFocus) {
        FocusScope.of(Get.context!).requestFocus(_passwordFocusNode!);
      }
    }
  }

  void onPasswordSubmitted(String value) {
    if (_isDisposed) return;

    validateForm();

    if (isFormValid.value) {
      onLoginPressed();
    }
  }
}
