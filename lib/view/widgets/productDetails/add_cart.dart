// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controllers/cart_controller.dart';
import 'package:ushop_app/models/product_models.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
  final controller=Get.find<CartController>();
   AddCart({super.key, required this.price, required this.productModels});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtiles(
                text: 'Price',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                underline: TextDecoration.none,
              ),
              Text('\$$price',style: TextStyle(color: Get.isDarkMode? Colors.white: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,height: 1.5),),
            
            
            ],
          ),

          SizedBox(width: 20,),
          Expanded(
            child:SizedBox(
              height: 60,
              
                   child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                
                ),
                elevation: 0,
                primary: Get.isDarkMode? mainColor:mainColor,
              ),
              onPressed: (){
                controller.addProductToCart(productModels);
              },
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add to Cart",
                 style: TextStyle (color: Get.isDarkMode? Colors.white: Colors.black,fontSize: 20,),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.shopping_cart_outlined),
          
            ],
            ),
            ),
            ),
       
          ),
        ],
      
      ),
    );
  }
}
