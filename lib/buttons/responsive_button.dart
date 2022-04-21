import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mountain_trips/texts/sub_text.dart';

class ResponsiveButton extends StatelessWidget {
   ResponsiveButton({Key? key, this.isResponsive = false,  this.b_width = 120}) : super(key: key);
  final bool isResponsive;
   double b_width;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive? double.maxFinite : b_width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.shade400,
        ),
        child: Row(
          mainAxisAlignment: isResponsive? MainAxisAlignment.spaceAround : MainAxisAlignment.center,
    
          children: [
            isResponsive?SubText(text: 'Book Trip Now', color: Colors.white,) : Container(),
            Image.asset('images/arrows.png'),
          ],
        ),
      ),
    );
  }
}
