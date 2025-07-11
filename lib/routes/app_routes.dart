
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/auth/screens/address_page.dart';
import '../features/auth/screens/create_account_page.dart';
import '../features/auth/screens/pass_security_page.dart';
import '../features/splash/bindings/splash_binding.dart';
import '../features/splash/screens/splash_screen.dart';

import '../features/home/bindings/home_binding.dart';
import '../features/home/screens/home_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const createAccountPage = '/create-account';
  static const addressPage = '/addressPage';
  static const passAndSecurityPage = '/passAndSecurityPage';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/create-account',
      page: () => CreateAccountPage(),
    ),
    GetPage(
      name: '/addressPage',
      page: () => AddressPage(),
    ),
    GetPage(
      name: '/passAndSecurityPage',
      page: () => PassAndSecurityPage(),
    ),

  ];
}
