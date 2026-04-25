import 'package:get/get.dart';

class MessageDitailController extends GetxController {
  final List<Map<String, dynamic>> messages = [
    {
      'isMe': false,
      'text': 'Hi there! 👋 How did today\'s training session go?',
      'time': '2:34 PM',
    },
    {
      'isMe': true,
      'text': 'It went really well! Buddy is getting much better at the stay command.',
      'time': '2:35 PM',
    },
  ];
}


