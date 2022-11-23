// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:ushop_app/logic/bindings/auth_bindings.dart';
import 'package:ushop_app/logic/bindings/main_binding.dart';
import 'package:ushop_app/logic/bindings/product_binding.dart';
import 'package:ushop_app/logic/controllers/product_controller.dart';
import 'package:ushop_app/view/screens/auth/forgot_password_screen.dart';
import 'package:ushop_app/view/screens/auth/login_screen.dart';
import 'package:ushop_app/view/screens/auth/signup_screen.dart';
import 'package:ushop_app/view/screens/cart_screen.dart';
import 'package:ushop_app/view/screens/main_screen.dart';
import 'package:ushop_app/view/screens/welcome_screen.dart';

class AppRoutes {
  // initial routes
  static const welcome = Routes.WelcomeScreen;
  static const mainScreen = Routes.mainScreen;
  // static const signup = Routes.SignUpScreen;

  // get pages

  // static عشان نقدر نوصل لها باي مكان
  static final routes = [
    GetPage(name: Routes.WelcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.LoginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.SignUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.ForgetPasswordScreen,
        page: () => ForgetPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.mainScreen,
        page: () => MainScreen(),
        bindings: [AuthBinding(), MainBinding(), ProductBindings()]),
    GetPage(name: Routes.cartScreen, page: () => CartScreen(), bindings: [
      AuthBinding(),
      ProductBindings(),
    ]),
  ];
}

// هنا نصنع الراوتس ونناديها فوق
class Routes {
  static const WelcomeScreen = '/welcomeScreen';
  static const LoginScreen = '/LoginScreen';
  static const SignUpScreen = '/SignUpScreen';
  static const ForgetPasswordScreen = '/ForgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
