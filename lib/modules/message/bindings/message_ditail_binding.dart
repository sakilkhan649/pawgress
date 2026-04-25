import 'package:get/get.dart';
import 'package:pawgress/modules/message/controllers/message_ditail_controller.dart';

class MessageDitailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageDitailController>(() => MessageDitailController());
  }
}