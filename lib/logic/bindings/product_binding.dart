



import 'package:get/instance_manager.dart';
import 'package:ushop_app/logic/controllers/cart_controller.dart';
import 'package:ushop_app/logic/controllers/category_controller.dart';
import 'package:ushop_app/logic/controllers/product_controller.dart';

class ProductBindings extends Bindings{
  @override
  void dependencies() {
// تفتح لي بسرعه اول مايشتغل البرنامج
  Get.put(ProductController());
  // اذا طلبت من البرنامج شي يشغل لي اياه متى ماطلبته مو علطول
  Get.lazyPut(() => CartController());
  Get.put(CategoryController());
  }

}