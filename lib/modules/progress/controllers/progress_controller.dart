import 'package:get/get.dart';

class ProgressController extends GetxController {
  final RxString selectedFilter = 'Week'.obs;

  void selectFilter(String filter) {
    selectedFilter.value = filter;
  }
}
