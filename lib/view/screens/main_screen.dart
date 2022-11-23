// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controllers/cart_controller.dart';
import 'package:ushop_app/logic/controllers/main_controller.dart';
import 'package:ushop_app/routes/routes.dart';
import 'package:ushop_app/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final controller = Get.find<MainController>();
    final cartcontroller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        // Activate the theme
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: Container(),

          // Dark Mode onPress+Getx
          actions: [
          Obx(() =>  Badge(
              position: BadgePosition.topEnd(top: 0, end: 3),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                cartcontroller.quantity().toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.cartScreen);
                },
                icon: Image.asset('assets/images/shop.png'),
              ),
          ),
          ),
          ],
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
          // to style the theme to be suitable

          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          // add .value
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? mainColor : mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? mainColor : mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? mainColor : mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? mainColor : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),
          ],

          onTap: ((index) {
            controller.currentIndex.value = index;
          }),
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
