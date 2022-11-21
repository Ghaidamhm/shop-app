import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ushop_app/view/screens/category_screen.dart';
import 'package:ushop_app/view/screens/favorites_screen.dart';
import 'package:ushop_app/view/screens/home_screen.dart';
import 'package:ushop_app/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  final title = ['Ghaida Shop', 'Categories', 'Favorites', 'Settings'].obs;
}
