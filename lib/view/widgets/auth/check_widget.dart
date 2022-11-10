// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/images/check.png'),
          ),
        ),
        Row(
          children: [
            TextUtiles(
                text: '  I accept ',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode? Colors.black : Colors.white,
                underline: TextDecoration.none),
            TextUtiles(
              text: 'terms & conditions',
              fontSize: 16,
              fontWeight: FontWeight.normal,
                color: Get.isDarkMode? Colors.black : Colors.white,
              underline: TextDecoration.underline,
            )
          ],
        )
      
      
      ],
    );
  }
}
