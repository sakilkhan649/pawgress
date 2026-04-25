import 'package:get/get.dart';
import 'package:pawgress/modules/profile/controllers/dog_information_controller.dart';

class DogInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DogInformationController>(
      () => DogInformationController(),
    );
  }
}