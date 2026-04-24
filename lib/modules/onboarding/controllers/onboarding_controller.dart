import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawgress/config/routes/app_pages.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  final List<OnboardingContent> contents = [
    OnboardingContent(
      title: 'Your Pup\'s Glow-Up Starts NOW!',
      description: 'Turn your playful pup into a well-trained ',
      description2: 'superstar — one trick at a time!',
      image: 'assets/images/dog_image.png',
    ),
    OnboardingContent(
      title: 'Oops! Your Dog\'s About to Get Smart',
      description: 'Because every good dog deserves',
      description2: 'great training (and a few treats)',                              
      image: 'assets/images/dog_image.png',
    ),
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void next() {
    if (currentPage.value < contents.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      skip();
    }
  }

  void back() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}

class OnboardingContent {
  final String title;
  final String description;
  final String description2;
  final String image;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.description2,
    required this.image,
  });
}
