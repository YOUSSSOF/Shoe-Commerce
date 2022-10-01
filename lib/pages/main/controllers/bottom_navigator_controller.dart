import 'package:ecommerce/pages/home/ui/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavigatorController extends GetxController {
  RxInt index = 0.obs;
  var views = [
    HomePage(),
    Container(),
    Container(),
    Container(),
  ];
  void changeIndex(int i) => index.value = i;
}
