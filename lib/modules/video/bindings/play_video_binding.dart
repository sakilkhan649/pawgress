import 'package:get/get.dart';
import 'package:pawgress/modules/video/controllers/play_video_controller.dart';

class PlayVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayVideoController>(() => PlayVideoController());
  }
}