import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/pages/home/home_page.dart';
import 'package:payuung_pribadi/pages/bottom_nav/bottom_navigation.dart';
import 'package:payuung_pribadi/routes/page_route.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return RefreshConfiguration(
      footerBuilder: () => const ClassicFooter(
        loadingIcon: SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: kColorWhite,
              strokeWidth: 2,
            )),
      ),
      headerBuilder: () => const WaterDropMaterialHeader(
        backgroundColor: kColorPrimary,
        distance: 40,
      ),
      child: GetMaterialApp(
        title: 'Payyung Pribadi',
        getPages: PagesRoute.pages,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Inter',
          splashColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        home: BottomNavigationPage(),
      ),
    );
  }
}
