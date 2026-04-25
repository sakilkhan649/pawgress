class LibraryModel {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final String duration;
  final String category;
  final String trainerName;
  final String trainerImage;
  final String videoUrl;

  LibraryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.duration,
    required this.category,
    required this.trainerName,
    required this.trainerImage,
    this.videoUrl = '',
  });
}
