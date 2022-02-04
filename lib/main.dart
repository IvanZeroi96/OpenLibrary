import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robin_food_library/model/colors.dart';
import 'package:robin_food_library/view/detail/detail_page.dart';
import 'package:robin_food_library/view/favorite/favorite_page.dart';
import 'package:robin_food_library/view/home/home_page.dart';
import 'package:robin_food_library/view/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Open Library',
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        navigatorObservers: [GetObserver()],
        theme: ThemeData(
          primarySwatch: RFLColors.primaryColor,
        ),
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => const SplashPage(),
          ),
          GetPage(
            name: '/home',
            page: () => const HomePage(),
            transition: Transition.native,
            transitionDuration: const Duration(milliseconds: 700),
          ),
          GetPage(
            name: '/detail',
            page: () => const DetailPage(),
          ),
          GetPage(
            name: '/favorite',
            page: () => const FavoritePage(),
            transition: Transition.native,
            transitionDuration: const Duration(milliseconds: 700),
          ),
        ]
        );
  }
}
