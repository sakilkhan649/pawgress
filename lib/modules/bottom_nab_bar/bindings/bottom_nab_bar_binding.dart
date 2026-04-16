import 'package:get/get.dart';
import '../controllers/bottom_nab_bar_controller.dart';

class BottomNabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNabBarController>(
          () => BottomNabBarController(),
      fenix: true,           // এটা রাখলে ভালো হয়
    );
  }
}