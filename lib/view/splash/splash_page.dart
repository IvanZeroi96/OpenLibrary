
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:robin_food_library/controller/splash/splash_controller.dart';
import 'package:robin_food_library/model/colors.dart';

class SplashPage extends StatelessWidget{
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (get) {
        return Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.1,
                  0.8
                ],
                colors: [RFLColors.primaryColors, Colors.grey],
                tileMode: TileMode.clamp,
              )
          ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/openlibrary_logo_tighter.svg',
                height: 60.0,
                width: 55.0,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          );
      },
    );
  }
}