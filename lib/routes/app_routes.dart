
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/auth/screens/address_page.dart';
import '../features/auth/screens/create_account_page.dart';
import '../features/auth/screens/how_to_play.dart';
import '../features/auth/screens/pass_security_page.dart';
import '../features/auth/screens/sign_in.dart';
import '../features/home/bindings/ClubPageBinding.dart';
import '../features/home/screens/ClubInfoPage.dart';
import '../features/home/screens/playerList.dart';
import '../features/home/screens/player_stats_info.dart';
import '../features/home/screens/squad.dart';
import '../features/prediction/screens/prediction_widget.dart';
import '../features/splash/bindings/splash_binding.dart';
import '../features/splash/screens/splash_screen.dart';

import '../features/home/bindings/home_binding.dart';
import '../features/home/screens/home_screen.dart';
import '../features/statistic/screens/staistic_table.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const createAccountPage = '/create-account';
  static const addressPage = '/addressPage';
  static const passAndSecurityPage = '/passAndSecurityPage';
  static const signInPage = '/signInPage';
  static const howToPlayPage = '/howToPlayPage';
  static const clubInfoPage = '/clubInfoPage';
  static const squadPage = '/squadPage';
  static const playerListPage = '/playerListPage';
  static const playerStatsInfoPage = '/playerStatsInfoPage';
  static const predictionPage = '/predictionPage';
  static const statisticsTablePage = '/statisticsTablePage';

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
    GetPage(
      name: squadPage,
      page: () => SquadPage(),
    ),
    GetPage(
      name: playerListPage,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return PlayerListPage(
          pageTitle: args['title'] ?? '',
          players: args['players'] ?? [],
        );
      },
    ),
    GetPage(
      name: playerStatsInfoPage,
      page: () => PlayerStatsInfoPage(
        pageTitle: Get.arguments['title'],
      ),
    ),
    GetPage(
      name: statisticsTablePage,
      page: () => StatisticsTablePage(
        pageTitle: Get.arguments['title'],
      ),
    ),

  ];
}
