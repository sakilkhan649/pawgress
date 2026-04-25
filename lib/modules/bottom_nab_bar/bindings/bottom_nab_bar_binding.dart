import 'package:get/get.dart';
import '../controllers/bottom_nab_bar_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../lessons/controllers/lessons_controller.dart';
import '../../progress/controllers/progress_controller.dart';
import '../../schedule/controllers/schedule_controller.dart';
import '../../profile/controllers/profile_controller.dart';

class BottomNabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNabBarController>(
      () => BottomNabBarController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<LessonsController>(
      () => LessonsController(),
      fenix: true,
    );
    Get.lazyPut<ProgressController>(
      () => ProgressController(),
      fenix: true,
    );
    Get.lazyPut<ScheduleController>(
      () => ScheduleController(),
      fenix: true,
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
      fenix: true,
    );
  }
}