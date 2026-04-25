import 'package:get/get.dart';
import '../controllers/behavior_controller.dart';

class BehaviorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BehaviorController>(() => BehaviorController());
  }
}