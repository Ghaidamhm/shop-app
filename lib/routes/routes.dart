import 'package:get/get.dart';
import 'package:ushop_app/view/screens/auth/login_screen.dart';
import 'package:ushop_app/view/screens/auth/signup_screen.dart';
import 'package:ushop_app/view/screens/welcome_screen.dart';

class AppRoutes {
  // initial routes
  static const welcome = Routes.WelcomeScreen;
  // static const login = Routes.LoginScreen;
  // static const signup = Routes.SignUpScreen;



  // get pages

  // static عشان نقدر نوصل لها باي مكان
  static final routes = [
    GetPage(name: Routes.WelcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: Routes.LoginScreen, page: () => const LoginScreen()),
    GetPage(name: Routes.SignUpScreen, page: () =>  SignUpScreen()),


  ];
}


// هنا نصنع الراوتس ونناديها فوق
class Routes {
  static const WelcomeScreen = '/welcomeScreen';
    static const LoginScreen = '/LoginScreen';
    static const SignUpScreen = '/SignUpScreen';
    

}
