import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/routes/routes.dart';

void main() async {
  // هذا السطر يقول للبرنامج لو سمحت اطلب لي خدمات الفايربيس وبعدها شغل الآب 
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
