import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/sign_screen.dart';
import 'package:greengrocer/src/pages/auth/signup_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PagesRoutes.siginRoute,
      page: () => const SignScreen(),
    ),
    GetPage(
      name: PagesRoutes.signupRoute,
      page: () => SignupScren(),
    ),
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => const BaseScreen(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String siginRoute = '/signin';
  static const String splashRoute = '/splash';
  static const String signupRoute = '/signup';
  static const String baseRoute = '/';
}
