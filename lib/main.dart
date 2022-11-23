import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ushop_app/language/localization.dart';
import 'package:ushop_app/logic/controllers/theme_controller.dart';
import 'package:ushop_app/routes/routes.dart';
import 'package:ushop_app/utils/my_string.dart';
import 'package:ushop_app/utils/theme.dart';

void main() async {
  // هذا السطر يقول للبرنامج لو سمحت اطلب لي خدمات الفايربيس وبعدها شغل الآب 
  WidgetsFlutterBinding.ensureInitialized();

  // حقت المود دارك او لايت
await GetStorage.init();

  // انتظر خدمات الفاير بيس قبل مايشتغل برنامجك
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Asroo Shop',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      translations: LocaliztionApp(),
      fallbackLocale: Locale(ene),
      // Dark theme class from (theme.dart) changing color activated
      theme: ThemesApp.light ,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().ThemeDataGet,
      // Email and password to save
      initialRoute: FirebaseAuth.instance.currentUser != null || GetStorage().read<bool>('auth')==true ? AppRoutes.mainScreen : AppRoutes.welcome, //الصفحه الرئيسيه
      getPages: AppRoutes.routes,
    );
  }
}
