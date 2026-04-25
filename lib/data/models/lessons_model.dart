class LessonsModel {
  final String title;
  final String description;
  final String duration;
  final String category;
  final double progress;
  final String status;
  final String? videoUrl;
  final int currentRepetitions;
  final int totalRepetitions;

  LessonsModel({
    required this.title,
    required this.description,
    required this.duration,
    required this.category,
    required this.progress,
    required this.status,
    this.videoUrl,
    this.currentRepetitions = 0,
    this.totalRepetitions = 10,
  });
}
