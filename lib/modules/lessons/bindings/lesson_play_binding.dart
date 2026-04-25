import 'package:get/get.dart';
import 'package:pawgress/modules/lessons/controllers/lesson_play_controller.dart';

class LessonPlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LessonPlayController());
  }
}