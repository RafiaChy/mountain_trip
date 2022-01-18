import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton({Key? key, this.isResponsive = false, required this.b_width}) : super(key: key);
  final bool isResponsive;
  final double b_width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: b_width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black45,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset('images/arrows.png'),
        ],
      ),
    );
  }
}
