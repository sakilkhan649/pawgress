import 'package:get/get.dart';
import '../../../data/models/library_model.dart';
import '../../../config/constants/image_paths.dart';

class VideoController extends GetxController {
  final RxString selectedCategory = 'All'.obs;
  final RxString searchQuery = ''.obs;

  final List<LibraryModel> allVideos = [
    LibraryModel(
      id: '1',
      title: 'Basic Sit Command Tutorial',
      description: 'Training tutorial',
      thumbnail: ImagePaths.dogProfileImage,
      duration: '5:32',
      category: 'Basic',
      trainerName: 'Sarah Mitchell',
      trainerImage: ImagePaths.dogProfileImage,
    ),
    LibraryModel(
      id: '2',
      title: 'Mastering Recall in Parks',
      description: 'Outdoor engagement',
      thumbnail: ImagePaths.dogProfileImage,
      duration: '12:45',
      category: 'Advanced',
      trainerName: 'Sarah Mitchell',
      trainerImage: ImagePaths.dogProfileImage,
    ),
    LibraryModel(
      id: '3',
      title: 'Curbing Destructive Chewing',
      description: 'Behavioral foundations',
      thumbnail: ImagePaths.dogProfileImage,
      duration: '8:20',
      category: 'Behavior',
      trainerName: 'Sarah Mitchell',
      trainerImage: ImagePaths.dogProfileImage,
    ),
  ];

  List<LibraryModel> get filteredVideos {
    return allVideos.where((video) {
      final matchesCategory = selectedCategory.value == 'All' || video.category == selectedCategory.value;
      final matchesSearch = video.title.toLowerCase().contains(searchQuery.value.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void setSearch(String query) {
    searchQuery.value = query;
  }
}