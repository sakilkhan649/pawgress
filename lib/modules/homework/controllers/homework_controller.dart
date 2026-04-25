import 'package:get/get.dart';

class HomeworkController extends GetxController {
  final List<Map<String, dynamic>> homeworks = [
    {
      'title': 'Week 1: Basic Commands Guide',
      'description': 'Essential first steps for puppy training.',
      'date': 'Apr 12, 2026',
      'pages': '12 Pages',
      'size': '2.4 MB',
      'isNew': true,
      'isImportant': false,
    },
    {
      'title': 'Feeding & Nutrition',
      'description': 'Healthy habits for your pet.',
      'date': 'Apr 10, 2026',
      'pages': '8 Pages',
      'size': '1.1 MB',
      'isNew': false,
      'isImportant': false,
    },
    {
      'title': 'Body Language Cheat Sheet',
      'description': 'Visual reference guide for...',
      'date': 'Oct 15, 2023',
      'pages': '4 Pages',
      'size': '3.5 MB',
      'isNew': false,
      'isImportant': true,
    },
  ];
}