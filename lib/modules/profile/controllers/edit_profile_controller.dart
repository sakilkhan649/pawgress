import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController(text: 'Alex Johnson');
  final emailController = TextEditingController(text: 'alex.johnson@email.com');
  final phoneController = TextEditingController(text: '+1 (555) 123-4567');

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}

