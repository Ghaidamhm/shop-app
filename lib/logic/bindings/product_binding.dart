



import 'package:get/instance_manager.dart';
import 'package:ushop_app/logic/controllers/product_controller.dart';

class ProductBindings extends Bindings{
  @override
  void dependencies() {

  Get.put(ProductController());

  }

}