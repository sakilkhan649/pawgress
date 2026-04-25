import 'package:get/get.dart';

class MessageController extends GetxController {
  final List<Map<String, dynamic>> conversations = [
    {
      'name': 'Sarah Mitchell',
      'lastMessage': 'I just submitted the project report for the Design Thinking module...',
      'time': '2m ago',
      'unreadCount': 2,
      'isOnline': true,
      'image': 'assets/images/onboarding_dog.png', // Placeholder
    },
    {
      'name': 'Dr. Julian Vane',
      'lastMessage': 'Great work on your thesis proposal. Let\'s meet tomorrow to discuss.',
      'time': '1h ago',
      'unreadCount': 0,
      'isOnline': true,
      'image': 'assets/images/onboarding_dog.png', // Placeholder
    },
    {
      'name': 'Mark Thompson',
      'lastMessage': 'Are you coming to the group study session later tonight?',
      'time': '3h ago',
      'unreadCount': 0,
      'isOnline': false,
      'image': 'assets/images/onboarding_dog.png', // Placeholder
    },
  ];
}


