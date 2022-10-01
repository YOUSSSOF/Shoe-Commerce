import 'package:ecommerce/network/models/cart_item.dart';
import 'package:ecommerce/network/models/shoe.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> items = <CartItem>[].obs;
  RxDouble total = 0.0.obs;
  void addToCart(Shoe shoe) {
    for (var item in items) {
      if (item.shoe.id == shoe.id) {
        items[items.indexOf(item)].quantity += 1;
        return;
      }
    }
    items.add(CartItem(shoe: shoe));
    calTotal();
    update();
  }

  void addQuantity(CartItem item) {
    item.quantity++;
    calTotal();
    update();
  }

  void lowQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      items.remove(item);
    }
    calTotal();
    update();
  }

  void calTotal() {
    total.value = 0;
    for (var item in items) {
      total.value += item.shoe.price * item.quantity;
    }
  }
}
