// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controllers/product_controller.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  final controller = Get.put(ProductController()) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favoritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/heart.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please, Add your favorites products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                  image: controller.favoritesList[index].image,
                  price: controller.favoritesList[index].price,
                  title: controller.favoritesList[index].title ,
                                    productId: controller.favoritesList[index].id ,

                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favoritesList.length );
        }
      }),
    );
  }

  Widget buildFavItems({
    required String image,
    required double price,
    required String title,
    required int productId,

  }) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,



                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   title,
                    style: TextStyle(
                        // to devide the lines if its long
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                        // to devide the lines if its long
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                controller.manageFavorites(productId);
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
