import 'package:get/get.dart';
import 'package:pawgress/modules/bottom_nab_bar/bindings/bottom_nab_bar_binding.dart';
import 'package:pawgress/modules/bottom_nab_bar/views/bottom_nab_bar_view.dart';
import 'package:pawgress/modules/splash/bindings/splash_binding.dart';
import 'package:pawgress/modules/splash/views/splash_view.dart';

class AppRoutes {
  // Routes Name
  static const String SPLASH = '/splash';
  static const String BOTTOM_NAB_BAR = '/bottom_nab_bar';

  // All Pages
  static final pages = [
    GetPage(
      name: SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.BOTTOM_NAB_BAR,
    //   page: () => const BottomNabBarView(),
    //   binding: BottomNabBarBinding(),
    // ),
    // পরে অন্যান্য রুট যোগ করবে
  ];
}
