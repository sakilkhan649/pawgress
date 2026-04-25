import 'package:get/get.dart';
import 'package:pawgress/modules/auth/views/login_view.dart';
import 'package:pawgress/modules/auth/views/new_password_view.dart';
import 'package:pawgress/modules/auth/bindings/new_password_binding.dart';
import 'package:pawgress/modules/auth/views/otp_view.dart';
import 'package:pawgress/modules/auth/views/successfull_view.dart';
import 'package:pawgress/modules/auth/bindings/success_binding.dart';
import 'package:pawgress/modules/auth/views/signUp_view.dart';
import 'package:pawgress/modules/auth/bindings/sign_up_binding.dart';
import 'package:pawgress/modules/behavior/bindings/behavior_binding.dart';
import 'package:pawgress/modules/behavior/views/behavior_view.dart';
import 'package:pawgress/modules/book_traning/views/book_traning_view.dart';
import 'package:pawgress/modules/book_traning/bindings/book_training_binding.dart';
import 'package:pawgress/modules/bottom_nab_bar/bindings/bottom_nab_bar_binding.dart';
import 'package:pawgress/modules/bottom_nab_bar/views/bottom_nab_bar_view.dart';
import 'package:pawgress/modules/condition/views/condition_view.dart';
import 'package:pawgress/modules/condition/bindings/condition_binding.dart';
import 'package:pawgress/modules/home/views/home_view.dart';
import 'package:pawgress/modules/home/bindings/home_binding.dart';
import 'package:pawgress/modules/homework/bindings/homework_binding.dart';
import 'package:pawgress/modules/homework/views/homework_view.dart';
import 'package:pawgress/modules/lessons/bindings/lesson_play_binding.dart';
import 'package:pawgress/modules/lessons/views/lesson_play_view.dart';
import 'package:pawgress/modules/lessons/views/lessons_view.dart';
import 'package:pawgress/modules/lessons/bindings/lessons_binding.dart';
import 'package:pawgress/modules/message/bindings/message_binding.dart';
import 'package:pawgress/modules/message/bindings/message_ditail_binding.dart';
import 'package:pawgress/modules/message/views/message_ditail_view.dart';
import 'package:pawgress/modules/message/views/message_views.dart';
import 'package:pawgress/modules/message/controllers/message_controller.dart';
import 'package:pawgress/modules/message/controllers/message_ditail_controller.dart';
import 'package:pawgress/modules/notification/views/notification_view.dart';
import 'package:pawgress/modules/notification/bindings/notification_binding.dart';
import 'package:pawgress/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:pawgress/modules/onboarding/views/onboarding_view.dart';
import 'package:pawgress/modules/auth/bindings/login_binding.dart';
import 'package:pawgress/modules/auth/views/otp_view.dart';
import 'package:pawgress/modules/auth/bindings/otp_binding.dart';
import 'package:pawgress/modules/auth/views/porgot_password_view.dart';
import 'package:pawgress/modules/auth/bindings/porgot_password_binding.dart';
import 'package:pawgress/modules/privacy/views/privacy_view.dart';
import 'package:pawgress/modules/privacy/bindings/privacy_binding.dart';
import 'package:pawgress/modules/profile/bindings/dog_information_binding.dart';
import 'package:pawgress/modules/profile/bindings/edit_dog_information_binding.dart';
import 'package:pawgress/modules/profile/views/dog_information.dart';
import 'package:pawgress/modules/profile/views/edit_dog_inpormation.dart';
import 'package:pawgress/modules/profile/views/edit_profile_view.dart';
import 'package:pawgress/modules/profile/views/profile_view.dart';
import 'package:pawgress/modules/profile/bindings/profile_binding.dart';
import 'package:pawgress/modules/profile/bindings/edit_profile_binding.dart';
import 'package:pawgress/modules/progress/views/progress_view.dart';
import 'package:pawgress/modules/progress/bindings/progress_binding.dart';
import 'package:pawgress/modules/schedule/views/schedule_view.dart';
import 'package:pawgress/modules/schedule/bindings/schedule_binding.dart';
import 'package:pawgress/modules/splash/bindings/splash_binding.dart';
import 'package:pawgress/modules/splash/views/splash_view.dart';
import 'package:pawgress/modules/support/views/contrac_support.dart';
import 'package:pawgress/modules/support/views/support_view.dart';
import 'package:pawgress/modules/support/bindings/support_binding.dart';
import 'package:pawgress/modules/support/bindings/contract_support_binding.dart';
import 'package:pawgress/modules/video/bindings/play_video_binding.dart';
import 'package:pawgress/modules/video/bindings/video_binding.dart';
import 'package:pawgress/modules/video/views/play_video_view.dart';
import 'package:pawgress/modules/video/views/videos_view.dart';


class AppRoutes {
  
  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const OTP = '/otp';
  static const forgotPassword = '/forgot-password';
  static const newPassword = '/new-password';
  static const success = '/success';
  static const signUp = '/sign-up';
  static const homeView = '/home-view';
  static const lessonView = '/lesson-view';
  static const progressView = '/progress-view';
  static const scheduleView = '/schedule-view';
  static const profileView = '/profile-view';
  static const bottomNavigation = '/bottom-navigation';
  static const editProfileView = '/edit-profile-view';
  static const dogInformationView = '/dog-information-view';
  static const editDogInformationView = '/edit-dog-information-view';
  static const privacyView = '/privacy-view';
  static const conditionView = '/condition-view';
  static const supportView = '/support-view';
  static const contractSupportView = '/contract-support-view';
  static const notificationView = '/notification-view';
  static const lessonPlayView = '/lesson-play-view';
  static const bookTrainingView = '/book-training-view';
  static const messageView = '/message-view';
  static const messageDitailView = '/message-ditail-view';
  static const videoView = '/video-view';
  static const playVideoView = '/play-video-view';
  static const behaviorView = '/behavior-view';
  static const homeworkView = '/homework-view';
  
  
  
  
  


  static final List<GetPage> pages = [
    GetPage(
      name: SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: forgotPassword,
      page: () => const PorgotPasswordView(),
      binding: PorgotPasswordBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: newPassword,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: success,
      page: () => const SuccessfullView(),
      binding: SuccessBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: homeView,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: lessonView,
      page: () => const LessonsView(),
      binding: LessonsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: progressView,
      page: () => const ProgressView(),
      binding: ProgressBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: scheduleView,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: profileView,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: bottomNavigation,
      page: () => const BottomNabBarView(),
      binding: BottomNabBarBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: editProfileView,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: dogInformationView,
      page: () => const DogInformationView(),
      binding: DogInformationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: editDogInformationView,
      page: () => const EditDogInformationView(),
      binding: EditDogInformationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: privacyView,
      page: () => const PrivacyView(),
      binding: PrivacyBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: conditionView,
      page: () => const ConditionView(),
      binding: ConditionBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: supportView,
      page: () => const SupportView(),
      binding: SupportBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: contractSupportView,
      page: () => const ContractSupportView(),
      binding: ContractSupportBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: notificationView,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: lessonPlayView,
      page: () => const LessonPlayView(),
      binding: LessonPlayBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: bookTrainingView,
      page: () => const BookTrainingView(),
      binding: BookTrainingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: messageView,
      page: () => const MessageViews(),
      binding: MessageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: messageDitailView,
      page: () => const MessageDitailView(),
      binding: MessageDitailBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: videoView,
      page: () => const VideoView(),
      binding: VideoBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: playVideoView,
      page: () => const PlayVideoView(),
      binding: PlayVideoBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: behaviorView,
      page: () => const BehaviorView(),
      binding: BehaviorBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: homeworkView,
      page: () => const HomeworkView(),
      binding: HomeworkBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
