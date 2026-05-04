import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dogNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;
  final isTermsAccepted = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  void toggleTerms(bool? value) {
    if (value != null) {
      isTermsAccepted.value = value;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dogNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
