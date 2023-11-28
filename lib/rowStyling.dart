import 'package:flutter/material.dart';
import 'package:poke_app/text_style.dart';

Widget rowStyling(
{
  String? text,
  String? value,
  Color? color
}
    ){
  return Row(
    children: [
      SizedBox(
          width: 100,
          child: headingText(
              color: color,
              size: 16,
              text: text)),
      headingText(
          color: Colors.grey, size: 16, text: value),
    ],
  );
}
