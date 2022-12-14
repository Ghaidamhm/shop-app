// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controllers/cart_controller.dart';
import 'package:ushop_app/logic/controllers/product_controller.dart';
import 'package:ushop_app/models/product_models.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/screens/product_details_screen.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    // هنا عشان يعطيني مربعات الايتمز اللي بتطلع بالمتجر
    return Obx(() {
      if (controller.isLoadding.value) {
        return Center(
          child: CircularProgressIndicator(
            color: mainColor,
          ),
        );
      } else {
        return Expanded(
          child:
        controller.searchList.isEmpty && controller.searchTextController.text.isNotEmpty?
    Get.isDarkMode?  Image.asset('assets/images/search_empty_dark.png') :Image.asset('assets/images/search_empry_light.png'):
           GridView.builder(
              itemCount: controller.searchList.isEmpty?controller.productsList.length:controller.searchList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6,
                  maxCrossAxisExtent: 200),
              itemBuilder: (context, index) {
                if (controller.searchList.isEmpty) {
                  return buildCardItems(
                      image: controller.productsList[index].image,
                      price: controller.productsList[index].price,
                      rate: controller.productsList[index].rating.rate,
                      productId: controller.productsList[index].id,
                      productModels: controller.productsList[index],
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                              productModels: controller.productsList[index],
                            ));
                      });
                } else {
                  return buildCardItems(
                      image: controller.searchList[index].image,
                      price: controller.searchList[index].price,
                      rate: controller.searchList[index].rating.rate,
                      productId: controller.searchList[index].id,
                      productModels: controller.searchList[index],
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                              productModels: controller.searchList[index],
                            ));
                      });
                }
              }),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                )
              ]),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavorites(productId);
                      },
                      icon: controller.isFavorites(productId)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtiles(
                                text: "$rate",
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                underline: TextDecoration.none),
                            Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
