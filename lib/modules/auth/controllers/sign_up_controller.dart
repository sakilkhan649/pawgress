import 'package:get/get.dart';

class SignUpController extends GetxController {
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
}
