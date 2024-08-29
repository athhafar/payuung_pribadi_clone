import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/bloc/profile/profile_bloc.dart';
import 'package:payuung_pribadi/pages/home/home_page.dart';
import 'package:payuung_pribadi/pages/bottom_nav/bottom_navigation.dart';
import 'package:payuung_pribadi/routes/page_route.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/database_helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(DatabaseHelper.instance),
        ),
      ],
      child: RefreshConfiguration(
        footerBuilder: () => ClassicFooter(
          loadingIcon: SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: kColorWhite,
              strokeWidth: 2,
            ),
          ),
        ),
        headerBuilder: () => WaterDropMaterialHeader(
          backgroundColor: kColorPrimary,
          distance: 40,
        ),
        child: GetMaterialApp(
          title: 'Payuung Pribadi',
          getPages: PagesRoute.pages,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Inter',
            splashColor: Colors.transparent,
          ),
          debugShowCheckedModeBanner: false,
          home: BottomNavigationPage(),
        ),
      ),
    );
  }
}
