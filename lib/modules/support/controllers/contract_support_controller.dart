import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContractSupportController extends GetxController {
  final subjectController = TextEditingController();
  final emailController = TextEditingController(text: 'john.doe@email.com');
  final messageController = TextEditingController();

  @override
  void onClose() {
    subjectController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
