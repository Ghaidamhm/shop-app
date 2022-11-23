import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controllers/setting_controller.dart';
import 'package:ushop_app/logic/controllers/theme_controller.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';






class DarkModeWidget extends StatelessWidget {
   DarkModeWidget({super.key});
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       buildIconWidget(),
        Switch(
            activeTrackColor: Get.isDarkMode ? mainColor : mainColor,
            activeColor: Get.isDarkMode ? mainColor : mainColor,
            value: controller.swithchValue.value,
            onChanged: (value) {
              ThemeController().changesTheme();
              controller.swithchValue.value = value;
            },
          ),
      ],
    ),
    );
  }


  Widget buildIconWidget(){
    return Material(
color: Colors.transparent,
child: Row(children: [
  Container(
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(shape: BoxShape.circle,color: darkSettings
    ),
    child: Icon(
      Icons.dark_mode,
      color: Colors.white,

    ),
  ),
  SizedBox(width: 20,),
  TextUtiles(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: "Dark Mode".tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underline: TextDecoration.none,
          ),
],),
    );
  }
}