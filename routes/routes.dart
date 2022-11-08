import 'package:get/get.dart';
import 'package:ushop_app/view/screens/welcome_screen.dart';

class AppRoutes {
  // initial routes
  static const welcome = Routes.WelcomeScreen;

  // get pages

  // static عشان نقدر نوصل لها باي مكان
  static final routes = [
    GetPage(name: Routes.WelcomeScreen, page: () => const WelcomeScreen()),
  ];
}


// هنا نصنع الراوتس ونناديها فوق
class Routes {
  static const WelcomeScreen = '/welcomeScreen';
}
