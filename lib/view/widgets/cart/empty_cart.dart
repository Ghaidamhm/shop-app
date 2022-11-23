// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/routes/routes.dart';
import 'package:ushop_app/utils/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,
          size: 150,
          color: Get.isDarkMode? Colors.white:Colors.black ,),
          SizedBox(height: 50,),
          RichText(text: TextSpan(children:[
             TextSpan(
            text: "Your Cart is ",
            style: TextStyle(
              color:Get.isDarkMode? Colors.white:Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
             ),
            TextSpan(
            text: "Empty",
            style: TextStyle(
              color:Get.isDarkMode?mainColor : mainColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )
          )
          
          ]
          ),

          
          ),
          SizedBox(height: 10,),

          Text("Add Items to get Started",
          style: TextStyle(
              color:Get.isDarkMode? Colors.white:Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: 50,),

        SizedBox(height: 50,
          child: ElevatedButton(style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),

            ),
            elevation: 0,
            primary:Get.isDarkMode? mainColor:mainColor,

          ),
            onPressed: (){Get.toNamed(Routes.mainScreen);}, child: Text('Go to Home',style: TextStyle(color: Colors.white,fontSize: 20),)))
        ],
      ),
    );
  }
}