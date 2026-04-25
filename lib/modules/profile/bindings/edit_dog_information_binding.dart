import 'package:get/get.dart';
import '../controllers/edit_dog_information_controller.dart';

class EditDogInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDogInformationController>(() => EditDogInformationController());
  }
}