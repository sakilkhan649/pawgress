import 'package:get/get.dart';

class BehaviorController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<DateTime> focusedDate = DateTime.now().obs;
  final RxString selectedFeeling = 'Calm'.obs;
  final RxList<String> selectedTags = <String>['Good with people'].obs;
  
  final List<Map<String, dynamic>> feelings = [
    {'name': 'Calm', 'icon': 'sentiment_satisfied_alt', 'color': 0xFF53D49D},
    {'name': 'Playful', 'icon': 'favorite_border', 'color': 0xFFFFC107},
    {'name': 'Anxious', 'icon': 'sentiment_dissatisfied', 'color': 0xFFFF7043},
    {'name': 'Energetic', 'icon': 'bolt', 'color': 0xFF42A5F5},
    {'name': 'Aggressive', 'icon': 'sentiment_very_dissatisfied', 'color': 0xFFEF5350},
  ];

  final List<String> availableTags = [
    'Good with people',
    'Good with dogs',
    'Responsive to commands',
    'Food motivated',
    'Distracted',
    'Focused',
    'Fearful',
    'Confident',
  ];

  final List<Map<String, dynamic>> recentLogs = [
    {
      'feeling': 'Calm',
      'time': 'Yesterday, 3:00 PM',
      'tags': ['GOOD WITH PEOPLE', 'FOCUSED'],
      'notes': 'Max was very responsive to commands even when other dogs were walking nearby. Great progress on distraction training today.',
      'color': 0xFF53D49D,
    },
    {
      'feeling': 'Playful',
      'time': 'Apr 15, 10:00 AM',
      'tags': ['GOOD WITH DOGS', 'ENERGETIC'],
      'notes': 'High energy morning. He loved playing fetch and was extremely social with the neighborhood golden retriever.',
      'color': 0xFFFFC107,
    },
  ];

  void selectFeeling(String name) => selectedFeeling.value = name;

  void updateDate(DateTime date) => selectedDate.value = date;
  void updateFocusedDate(DateTime date) => focusedDate.value = date;

  void toggleTag(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
  }
}