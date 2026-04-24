import 'package:get/get.dart';
import '../controllers/porgot_password_controller.dart';

class PorgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PorgotPasswordController>(
      () => PorgotPasswordController(),
    );
  }
}
