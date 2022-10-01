import 'package:ecommerce/pages/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}