// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const ContainerUnder({super.key, required this.text, required this.onPressed, required this.textType,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          TextUtiles(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underline: TextDecoration.none),
          TextButton(
            onPressed:onPressed,
            child: TextUtiles(
              text: textType,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underline: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
