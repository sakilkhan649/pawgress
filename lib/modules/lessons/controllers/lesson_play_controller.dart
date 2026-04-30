import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../data/models/lessons_model.dart';

class LessonPlayController extends GetxController {
  final Rx<LessonsModel?> currentLesson = Rx<LessonsModel?>(null);
  final RxInt currentRepetitions = 0.obs;

  // Video Player State
  VideoPlayerController? videoPlayerController;
  final RxBool isInitialized = false.obs;
  final RxBool isPlaying = false.obs;
  final Rx<Duration> position = Duration.zero.obs;
  final Rx<Duration> duration = Duration.zero.obs;
  final RxBool isMuted = false.obs;
  final RxBool isFullscreen = false.obs;

  @override
  void onInit() {
    super.onInit();
    final lesson = Get.arguments as LessonsModel?;
    if (lesson != null) {
      currentLesson.value = lesson;
      currentRepetitions.value = lesson.currentRepetitions;
      _initializeVideo();
    }
  }

  Future<void> _initializeVideo() async {
    // Using demo video for lessons as well
    const url = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

    print('Initializing lesson video with URL: $url');
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));

    try {
      await videoPlayerController!.initialize();
      isInitialized.value = true;
      isPlaying.value = videoPlayerController!.value.isPlaying;
      duration.value = videoPlayerController!.value.duration;
      isMuted.value = videoPlayerController!.value.volume == 0;

      videoPlayerController!.addListener(() {
        isPlaying.value = videoPlayerController!.value.isPlaying;
        position.value = videoPlayerController!.value.position;
      });
    } catch (e) {
      print('Error initializing lesson video: $e');
    }
  }

  void togglePlay() {
    if (videoPlayerController != null && isInitialized.value) {
      if (videoPlayerController!.value.isPlaying) {
        videoPlayerController!.pause();
      } else {
        videoPlayerController!.play();
      }
    }
  }

  void toggleVolume() {
    if (videoPlayerController != null && isInitialized.value) {
      if (isMuted.value) {
        videoPlayerController!.setVolume(1.0);
        isMuted.value = false;
      } else {
        videoPlayerController!.setVolume(0.0);
        isMuted.value = true;
      }
    }
  }

  void toggleFullscreen() {
    isFullscreen.value = !isFullscreen.value;
    if (isFullscreen.value) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  void seekForward() {
    if (videoPlayerController != null && isInitialized.value) {
      final newPosition =
          videoPlayerController!.value.position + const Duration(seconds: 10);
      videoPlayerController!.seekTo(
        newPosition > duration.value ? duration.value : newPosition,
      );
    }
  }

  void seekBackward() {
    if (videoPlayerController != null && isInitialized.value) {
      final newPosition =
          videoPlayerController!.value.position - const Duration(seconds: 10);
      videoPlayerController!.seekTo(
        newPosition < Duration.zero ? Duration.zero : newPosition,
      );
    }
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void seekToProgress(double progress) {
    if (videoPlayerController != null && isInitialized.value) {
      final newPosition = duration.value * progress;
      videoPlayerController!.seekTo(newPosition);
    }
  }

  void incrementRepetitions() {
    if (currentRepetitions.value < (currentLesson.value?.totalRepetitions ?? 10)) {
      currentRepetitions.value++;
    }
  }

  void decrementRepetitions() {
    if (currentRepetitions.value > 0) {
      currentRepetitions.value--;
    }
  }

  double get progress {
    if (currentLesson.value == null) return 0.0;
    return currentRepetitions.value / currentLesson.value!.totalRepetitions;
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }
}