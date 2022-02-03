import 'package:flutter/material.dart';
import 'package:robin_food_library/model/colors.dart';

class RFLCircularProgress extends StatelessWidget {

  final double width;
  final double height;
  final double stokeWidth;

  RFLCircularProgress({Key? key,
    this.width = 40.0,
    this.height = 40.0,
    this.stokeWidth = 2.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          valueColor: const AlwaysStoppedAnimation<Color>(RFLColors.primaryColors),
          backgroundColor: Colors.grey,
          strokeWidth: stokeWidth,
        )
    );
  }
}