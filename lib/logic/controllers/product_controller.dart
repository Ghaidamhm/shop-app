// import 'dart:html';



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ushop_app/models/product_models.dart';
import 'package:ushop_app/services/product_services.dart';

class ProductController extends GetxController {
// list from Internet (product models)
  var productsList = <ProductModels>[].obs;
  var favoritesList = <ProductModels>[].obs;

  var isLoadding = true.obs;
  var storage = GetStorage();

  // search
  var searchList = <ProductModels>[].obs;
  // search controller
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storedShoppings = storage.read<List>('isFavouritesList');
    if (storedShoppings != null) {
      favoritesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }

    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoadding(true);
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoadding(false);
    }
  }

// Logic for Favorite screen
  void manageFavorites(int productId) async {
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      await storage.remove("isFavouritesList");
    } else {
      // شيك لي اذا الاي دي اللي اخترته(اللي هو اللايك اللي سويته ع قطعه معينه)
      //  نفسه او لا
      favoritesList
          .add(productsList.firstWhere((element) => element.id == productId));
      await storage.write("isFavouritesList", favoritesList);
    }
  }

  bool isFavorites(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

  // search bar logic
  void addSearchToList(String searchName) {
    searchName=searchName.toLowerCase();


    searchList.value=productsList.where((search){
      var searchTitle=search.title.toLowerCase();
var searchPrice= search.price.toString().toLowerCase();

      return searchTitle.contains(searchName)|| searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }



  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
