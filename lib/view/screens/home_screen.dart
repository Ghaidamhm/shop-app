// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/home/card_items.dart';
import 'package:ushop_app/view/widgets/home/search_text_form.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? darkGreyClr : mainColor,
              borderRadius: BorderRadius.only(
                // حواف الكونتينر
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),

            // عشان اخلي الكلام مو لاصق على حدود اليسار
            child: Padding(
              padding:  EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  TextUtiles(
                      text: "Find Your",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underline: TextDecoration.none),

                  SizedBox(
                    height: 5,
                  ),
                  TextUtiles(
                      text: "INSPIRATION",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underline: TextDecoration.none),

                  SizedBox(
                    height: 20,
                  ),
                  // search field موجوده بالويدجت عشان مايصير الكود زحمه و بنناديها هنا
                  SearchFormText(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtiles(
                  text: "Categories",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode ?Colors.white:Colors.black  ,
                  underline: TextDecoration.none),
            ),
          ),
        
        SizedBox(height: 30,),

        CardItems(),

        ],
      ),
    ));
  }
}
