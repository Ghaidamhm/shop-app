import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/view/widgets/category/category_widget.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';



class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(padding: EdgeInsets.only(left: 15,top: 15),
      child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(padding: EdgeInsets.only(left: 15,top: 15),
         child: TextUtiles(
            color:Get.isDarkMode?
             Colors.white:Colors.black,
             fontSize: 30,
             fontWeight: FontWeight.bold,
             text: "Category",
             underline: TextDecoration.none,
          ),
          ),
    
        ),
        SizedBox(height: 20,),
    
        CategoryWidget(),
      ],),),
    );
  }
}