import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
