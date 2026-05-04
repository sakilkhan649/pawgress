import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
