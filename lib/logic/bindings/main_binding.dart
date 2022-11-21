


import 'package:get/instance_manager.dart';
import 'package:ushop_app/logic/controllers/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
Get.put(MainController()); 
 }

}