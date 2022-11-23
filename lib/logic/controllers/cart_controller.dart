// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ushop_app/models/product_models.dart';
import 'package:ushop_app/routes/routes.dart';
import 'package:ushop_app/utils/theme.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productMap.containsKey(productModels)) {
      productMap[productModels] += 1;
    } else {
      productMap[productModels] = 1;
    }
  }

  void removeProductFromCart(ProductModels productModels) {
    if (productMap.containsKey(ProductModels) &&
        productMap[productModels] == 1) {
      productMap.removeWhere((key, value) => key == productModels);
    } else {
      productMap[productModels] -= 1;
    }

    
  }

  void removeOneProduct(ProductModels productModels) {
    productMap.removeWhere((key, value) => key == productModels);
  }

  void clearAlllProducts() {
    Get.defaultDialog(
      title: "Clear Products ?",
      titleStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: "Your about to delete all items from your cart!",
      middleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Color.fromARGB(255, 189, 188, 188),
      radius: 10,
      textCancel: "No",
      cancelTextColor: Colors.white,
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? mainColor : mainColor,
    );
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if(productMap.isEmpty){
      return 0;
    }else{

   
    return productMap.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => value + element);
    }  
  }
}
