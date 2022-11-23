// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:ushop_app/logic/controllers/product_controller.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;
  ClothesInfo({super.key, required this.title, required this.productId, required this.rate, required this.description});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            Obx(
              (() => Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.manageFavorites(productId);
                      },
                      child: controller.isFavorites(productId)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                              size: 20,
                            ),
                    ),
                  )),
            ),
          ],
        ),
        Row(
          children: [
            TextUtiles(
                text: "$rate",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none),
               
               SizedBox(
                width: 8,
               )
               ,
                // RatingBar(
                //   rating: rate,
                //   icon:Icon(Icons.star,
                //   size: 20,
                //   color: Colors.grey,

                //   ) ,
                //   starCount: 5,
                //   spacing: 1,
                //   size: 20,
                //   isIndicator: false,
                //   allowHalfRating: true,
                //   onRatingCallback: (value, isIndicator) {
                //     isIndicator.value=true;

                //   },
                //   color: Colors.orangeAccent,
                // ),
          
      ]),
          SizedBox(height: 20,),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: "Read More",
            trimMode: TrimMode.Line ,
            trimExpandedText: "Read less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode? mainColor:mainColor,

            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode? mainColor:mainColor,
          ),
            style: TextStyle(
              fontSize: 16,
           
              height: 0,
              
              color: Get.isDarkMode? Colors.white:Colors.black,
          
         ),
        ),
        ],
        
      ),
    );
  }
}
