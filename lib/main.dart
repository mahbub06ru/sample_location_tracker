import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hbm/style/app_colors.dart';
import 'package:hbm/utility/constants.dart';
import 'package:hbm/view/screens/home/home_screen.dart';
import 'package:hbm/view/screens/intro/splash_screen.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
Future<void> main() async {

  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: AppColors.canvasColor,
        fontFamily: 'Urbanist',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(
              fontSize: 20,
              fontFamily: 'Urbanist',
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: const TextStyle(
              fontSize: 18,
              fontFamily: 'Urbanist',
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodySmall: const TextStyle(
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
            ),
        ),
      ),
      getPages: AppPage.getPages,
      initialRoute: '/splashPage',
    );
  }
}

class AppPage {
  static final getPages = [
    GetPage(
      name: '/splashPage',
      page: () => const SplashPage(),
    ),
    GetPage(
      name: '/homePage',
      page: () =>  const HomePage(),
    ),
  ];
}