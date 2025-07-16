
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/auth/screens/address_page.dart';
import '../features/auth/screens/create_account_page.dart';
import '../features/auth/screens/how_to_play.dart';
import '../features/auth/screens/pass_security_page.dart';
import '../features/auth/screens/sign_in.dart';
import '../features/home/bindings/ClubPageBinding.dart';
import '../features/home/screens/ClubInfoPage.dart';
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
  static const signInPage = '/signInPage';
  static const howToPlayPage = '/howToPlayPage';
  static const clubInfoPage = '/clubInfoPage';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: home,
      page: () =>  HomePage(),
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
    GetPage(
      name: '/signInPage',
      page: () => SignInPage(),
    ),
    GetPage(
      name: '/howToPlayPage',
      page: () => HowToPlayPage(),
    ),
    GetPage(
      name: '/clubInfoPage',
      page: () => ClubInfoPage(),
      // binding: ClubBinding(),
    ),

  ];
}
