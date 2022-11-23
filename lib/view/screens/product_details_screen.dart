import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/models/product_models.dart';
import 'package:ushop_app/view/widgets/productDetails/add_cart.dart';
import 'package:ushop_app/view/widgets/productDetails/clothes_info.dart';
import 'package:ushop_app/view/widgets/productDetails/image_slider.dart';
import 'package:ushop_app/view/widgets/productDetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({super.key, required this.productModels});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
         body: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    
            ImageSlider(imageUrl: productModels.image,
    
            ),
            ClothesInfo(
              title: productModels.title,
              productId: productModels.id,
              rate: productModels.rating.rate,
              description: productModels.description,
            ),
            SizeList(),
            AddCart(
              price: productModels.price,
              productModels: productModels,
            ),
          ],
         )),
      ),
    );
  }
}