import 'package:flutter/material.dart';
import 'package:mountain_trips/texts/sub_text.dart';

class ReusableButton extends StatelessWidget {
   ReusableButton({
    Key? key,
    this.text,
    this.icon,
    required this.size,
    required this.color,
    required this.backgroundcolor,
    required this.borderColor,
    required this.isIcon,
  }) : super(key: key);

  final Color color;
  final Color backgroundcolor;
  double size;
  String? text;
  IconData? icon;
  final Color borderColor;
  final bool isIcon;


  @override
  Widget build(BuildContext context) {
    return  Container(
      child: isIcon == false? Center(child: SubText(text: text!, color: color,)) : Icon(icon),
        margin: const EdgeInsets.only(right: 6),
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(15),
     ),
    );
  }
}
