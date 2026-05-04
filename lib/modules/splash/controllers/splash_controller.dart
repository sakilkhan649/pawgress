import 'package:get/get.dart';
import 'package:pawgress/config/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // 3 seconds delay before navigating to Onboarding
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.onboarding);
    });
  }
}