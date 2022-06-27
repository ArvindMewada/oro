import 'package:flutter/material.dart';
import 'package:oro_sample/home_module/widgets/home_widget.dart';
import 'package:oro_sample/locker_content_module/screens/locker_content_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '/utils/string.dart';
import 'image_assets_file.dart';

class UtilsCommon {
  appBarTextStyle(color, size, weight) {
    return TextStyle(color: color, fontSize: size, fontWeight: weight);
  }

  Text textWidget(
      String text, double fontSize, FontWeight weight, Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: appBarTextStyle(color, fontSize, weight),
    );
  }

  Text textWidgetPlan(
      String text, double fontSize, FontWeight weight, Color color) {
    return Text(
      text.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: weight,
          fontStyle: FontStyle.normal),
    );
  }

  Widget customButton() {
    return Center(
      child: GestureDetector(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xffFFE1A8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: textWidget(viewGold, 10, FontWeight.w700, Colors.black)),
      ),
    );
  }

  Widget customGradientButton(text, Function onPressed, bool isHomeScreen) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.w),
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow.shade400, const Color(0xffF8B830)],
          ),
          borderRadius: BorderRadius.circular(24)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textWidget(text, 14, FontWeight.w600, Colors.black),
          ],
        ),
      ),
    );
  }
}



class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.grey[700]!
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
