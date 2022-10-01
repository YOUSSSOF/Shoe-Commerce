import 'package:ecommerce/pages/main/controllers/bottom_navigator_controller.dart';
import 'package:get/get.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigatorController());
  }
}
