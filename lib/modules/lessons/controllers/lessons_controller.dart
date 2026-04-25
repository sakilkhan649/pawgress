import 'package:get/get.dart';

import '../../../data/models/lessons_model.dart';

class LessonsController extends GetxController {
  final RxString selectedCategory = 'All'.obs;

  final List<LessonsModel> allLessons = [
    LessonsModel(
      title: 'Sit Command Training',
      description: 'Learn the fundamental sit command with positive reinforcement techniques',
      duration: '20 min',
      category: 'Basic Commands',
      progress: 1.0,
      status: 'Completed',
    ),
    LessonsModel(
      title: 'Stay Command Training',
      description: 'Master the stay command to improve your dog\'s impulse control and patience.',
      duration: '25 min',
      category: 'Basic Commands',
      progress: 0.65,
      status: 'In Progress',
    ),
    LessonsModel(
      title: 'Fetch & Drop Training',
      description: 'Advanced retrieve training for interactive play and mental stimulation.',
      duration: '35 min',
      category: 'Advanced Training',
      progress: 0.0,
      status: 'Ready to start',
    ),
    LessonsModel(
      title: 'Leash Walking Basics',
      description: 'Stop pulling and enjoy peaceful walks with proper leash training',
      duration: '15 min',
      category: 'Behavior Training',
      progress: 0.0,
      status: 'Ready to start',
    ),
  ];

  List<LessonsModel> get filteredLessons {
    if (selectedCategory.value == 'All') {
      return allLessons;
    }
    return allLessons.where((lesson) => lesson.category.contains(selectedCategory.value)).toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}

