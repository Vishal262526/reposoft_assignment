import 'package:assignment/core/routes/route_name.dart';
import 'package:assignment/views/home_view.dart';
import 'package:assignment/views/login_view.dart';
import 'package:assignment/views/signup_view.dart';
import 'package:assignment/views/splash_view.dart';
import 'package:get/get.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RouteName.login,
      page: () => LoginView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.signup,
      page: () => SignupView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.home,
      page: () => HomeView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: RouteName.splash,
      page: () => const SplashView(),
    ),
  ];
}
