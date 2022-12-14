// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/setting/dark_mode_widget.dart';
import 'package:ushop_app/view/widgets/setting/language_widget.dart';
import 'package:ushop_app/view/widgets/setting/logout_widget.dart';
import 'package:ushop_app/view/widgets/setting/profile_widget.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          ProfileWidget(),

          SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          TextUtiles(
            text: 'GENERAL'.tr,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? mainColor : mainColor,
            underline: TextDecoration.none,
          ),

          SizedBox(
            height: 20,
          ),

          DarkModeWidget(),

          SizedBox(
            height: 20,
          ),

          LanguageWidget(),

          SizedBox(
            height: 20,
          ),
          LogOutWidget()
        ],
      ),

//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               onPressed: () {
//                 ThemeController().changesTheme();
//               },
//               child: Text(
//                 'Dark Mode',
//                 style: TextStyle(
//                   color: Get.isDarkMode ? Colors.white : Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             GetBuilder<AuthController>(builder: (controller) {
//               return TextButton(
//                 onPressed: () {
//                   // here to give logout choice a styling dialog

//                   Get.defaultDialog(
//                     title: "You Logged Out From The App",
//                     titleStyle: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     middleText: "Need LogOut ?",
//                     middleTextStyle: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     backgroundColor: Color.fromARGB(255, 189, 188, 188),
//                     radius: 10,
//                     textCancel: "No",
//                     cancelTextColor: Colors.white,
//                     textConfirm: "Yes",
//                     confirmTextColor: Colors.white,
//                     onCancel: () {
//                       Get.back();
//                     },
//                     onConfirm: () {
//                       controller.signOutFromApp();
//                     },
//                     buttonColor: Get.isDarkMode ? mainColor : mainColor,
//                   );
// // controller.signOutFromApp();
//                 },
//                 child: Text(
//                   'LogOut',
//                   style: TextStyle(
//                     color: Get.isDarkMode ? Colors.white : Colors.black,
//                   ),
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
    );
  }
}
