import 'package:get/get.dart';
import '../../../data/models/lessons_model.dart';

class LessonPlayController extends GetxController {
  final Rx<LessonsModel?> currentLesson = Rx<LessonsModel?>(null);
  final RxInt currentRepetitions = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final lesson = Get.arguments as LessonsModel?;
    if (lesson != null) {
      currentLesson.value = lesson;
      currentRepetitions.value = lesson.currentRepetitions;
    }
  }

  void incrementRepetitions() {
    if (currentRepetitions.value < (currentLesson.value?.totalRepetitions ?? 10)) {
      currentRepetitions.value++;
    }
  }

  void decrementRepetitions() {
    if (currentRepetitions.value > 0) {
      currentRepetitions.value--;
    }
  }

  double get progress {
    if (currentLesson.value == null) return 0.0;
    return currentRepetitions.value / currentLesson.value!.totalRepetitions;
  }
}