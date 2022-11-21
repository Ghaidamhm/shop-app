// will use GetStore to save the DarkMode status

//  create a class to call it instead of GetX to REDUCE THE RISK

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  // To save Mode Status  dark-light
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkModes';

// METODS:

// تحفظ القيمه هل هي دارك والا لايت
  saveThemeDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
  }

// تجيب لي حالة النظام هل هو دارك او لايت
 bool getThemeDataFromBox() {
                                  //  ?? false عشان هنا يمكن تكون القيمه نل مو فولس ولا ترو 
  return  boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get ThemeDataGet =>    getThemeDataFromBox()? ThemeMode.dark :ThemeMode.light;




  void changesTheme() {
        Get.changeThemeMode(getThemeDataFromBox() ? ThemeMode.light: ThemeMode.dark);

        // احفظ لي حالة التطبيق بعد مايختار المستخدم نوع المود دارك والا لايت عشان اذا رجع يفتح التطبيق يصير المود اللي اختاره للان موجود
        // علامة ال ! عشان تكون عكس ال فولس اللي هي القيمه الاساس
        saveThemeDataInBox(!getThemeDataFromBox());

  }
}
