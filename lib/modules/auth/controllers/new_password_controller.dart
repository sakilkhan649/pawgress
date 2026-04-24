import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }
}
