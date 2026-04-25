import 'package:get/get.dart';

class BookTrainingController extends GetxController {
  final RxInt selectedTrainerIndex = 0.obs;
  final RxInt selectedDateIndex = 1.obs; // TUE 17
  final RxString selectedSlot = '10:30 AM'.obs;

  final List<Map<String, String>> trainers = [
    {'name': 'Marcus', 'image': 'assets/images/onboarding_dog.png'},
    {'name': 'Elena', 'image': 'assets/images/onboarding_dog.png'},
    {'name': 'David', 'image': 'assets/images/onboarding_dog.png'},
    {'name': 'Sarah', 'image': 'assets/images/onboarding_dog.png'},
  ];

  final List<Map<String, String>> dates = [
    {'day': 'MON', 'date': '16'},
    {'day': 'TUE', 'date': '17'},
    {'day': 'WED', 'date': '18'},
    {'day': 'THU', 'date': '19'},
    {'day': 'FRI', 'date': '20'},
    {'day': 'SAT', 'date': '21'},
  ];

  final List<String> slots = [
    '09:00 AM',
    '10:30 AM',
    '12:00 PM',
    '02:00 PM',
    '04:30 PM',
    '06:00 PM',
  ];

  void selectTrainer(int index) => selectedTrainerIndex.value = index;
  void selectDate(int index) => selectedDateIndex.value = index;
  void selectSlot(String slot) => selectedSlot.value = slot;
}
