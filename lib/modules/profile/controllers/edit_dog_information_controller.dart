import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDogInformationController extends GetxController {
  final nameController = TextEditingController(text: 'Jack');
  final ageController = TextEditingController(text: '2 years');
  final breedController = TextEditingController(text: 'Golden Retriever');

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    breedController.dispose();
    super.onClose();
  }
}
