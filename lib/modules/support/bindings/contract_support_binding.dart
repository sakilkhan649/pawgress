import 'package:get/get.dart';
import '../controllers/contract_support_controller.dart';

class ContractSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContractSupportController>(() => ContractSupportController());
  }
}
