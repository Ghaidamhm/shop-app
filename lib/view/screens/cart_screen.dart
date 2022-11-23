import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controllers/cart_controller.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/cart/cart_total.dart';
import 'package:ushop_app/view/widgets/cart/empty_cart.dart';
import 'package:ushop_app/view/widgets/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: Text("Cart Items"),
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            actions: [
              IconButton(
                  onPressed: () {
                    controller.clearAlllProducts();
                  },
                  icon: Icon(Icons.backspace))
            ],
          ),
          body: Obx(
            () {
              if (controller.productMap.isEmpty) {
                return EmptyCart();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 600,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                index: index,
                                productModels:
                                    controller.productMap.keys.toList()[index],
                                quantity: controller.productMap.values
                                    .toList()[index],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                            itemCount: controller.productMap.length),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: CartTotal(),
                      ),
                    ],
                  ),
                ); 
              }
            },
          )),
    );
  }
}
