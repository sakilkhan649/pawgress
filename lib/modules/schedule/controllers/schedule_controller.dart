import 'package:get/get.dart';

class ScheduleController extends GetxController {
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<DateTime?> selectedDay = Rx<DateTime?>(DateTime.now());

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = selected;
    focusedDay.value = focused;
  }

  // Sample upcoming sessions
  final List<Map<String, dynamic>> upcomingSessions = [
    {
      'title': 'With Sarah Mitchell',
      'category': 'BASIC OBEDIENCE',
      'date': 'Today',
      'time': '3:00 PM',
      'image': 'assets/images/onboarding_dog.png', // Placeholder
    },
    {
      'title': 'with Mike Johnson',
      'category': 'BEHAVIORAL ASSESSMENT',
      'date': 'Today',
      'time': '2:00 PM',
      'image': 'assets/images/onboarding_dog.png', // Placeholder
    },
  ];
}
