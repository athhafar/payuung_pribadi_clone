import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:payuung_pribadi/pages/home/home_page.dart';
import 'package:payuung_pribadi/pages/profile/informasi_pribadi_page.dart';
import 'package:payuung_pribadi/pages/profile/profile_page.dart';

import 'route_name.dart';

class PagesRoute {
  PagesRoute._();

  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfilePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.informasiPribadi,
      page: () => InformasiPribadiPage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
