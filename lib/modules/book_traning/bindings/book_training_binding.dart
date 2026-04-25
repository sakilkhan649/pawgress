import 'package:get/get.dart';
import '../controllers/book_training_controller.dart';

class BookTrainingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookTrainingController>(
      () => BookTrainingController(),
    );
  }
}
