import 'package:get/get.dart';
import 'package:pawgress/modules/auth/views/login_view.dart';
import 'package:pawgress/modules/auth/views/new_password_view.dart';
import 'package:pawgress/modules/auth/bindings/new_password_binding.dart';
import 'package:pawgress/modules/auth/views/otp_view.dart';
import 'package:pawgress/modules/auth/views/successfull_view.dart';
import 'package:pawgress/modules/auth/bindings/success_binding.dart';
import 'package:pawgress/modules/auth/views/signUp_view.dart';
import 'package:pawgress/modules/auth/bindings/sign_up_binding.dart';
import 'package:pawgress/modules/home/views/home_view.dart';
import 'package:pawgress/modules/home/bindings/home_binding.dart';
import 'package:pawgress/modules/lessons/views/lessons_view.dart';
import 'package:pawgress/modules/lessons/bindings/lessons_binding.dart';
import 'package:pawgress/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:pawgress/modules/onboarding/views/onboarding_view.dart';
import 'package:pawgress/modules/auth/bindings/login_binding.dart';
import 'package:pawgress/modules/auth/views/otp_view.dart';
import 'package:pawgress/modules/auth/bindings/otp_binding.dart';
import 'package:pawgress/modules/auth/views/porgot_password_view.dart';
import 'package:pawgress/modules/auth/bindings/porgot_password_binding.dart';
import 'package:pawgress/modules/profile/views/profile_view.dart';
import 'package:pawgress/modules/profile/bindings/profile_binding.dart';
import 'package:pawgress/modules/progress/views/progress_view.dart';
import 'package:pawgress/modules/progress/bindings/progress_binding.dart';
import 'package:pawgress/modules/schedule/views/schedule_view.dart';
import 'package:pawgress/modules/schedule/bindings/schedule_binding.dart';

import 'package:pawgress/modules/splash/bindings/splash_binding.dart';
import 'package:pawgress/modules/splash/views/splash_view.dart';


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
  ];
}
