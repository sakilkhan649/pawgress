import 'package:get/get.dart';
import '../../../data/models/library_model.dart';

class PlayVideoController extends GetxController {
  late LibraryModel video;

  @override
  void onInit() {
    super.onInit();
    video = Get.arguments as LibraryModel;
  }
}