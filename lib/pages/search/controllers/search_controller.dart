import 'package:ecommerce/network/models/shoe.dart';
import 'package:ecommerce/pages/home/data/shoes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController(text: '');
  RxString search = ''.obs;
  RxList<Shoe> searchedShoes = <Shoe>[].obs;
  void onSearch() async {
    isLoading.value = true;
    searchedShoes.clear();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    search.value = searchController.text;
    if (search.isNotEmpty) {
      for (Shoe shoe in all) {
        shoe.name.contains(search) ? searchedShoes.add(shoe) : null;
      }
    }
    if (search.isEmpty) {
      searchedShoes.value = <Shoe>[];
    }
    isLoading.value = false;
  }
}
