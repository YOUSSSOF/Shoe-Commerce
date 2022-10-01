import 'package:ecommerce/network/models/shoe.dart';

class CartItem {
  Shoe shoe;
  int quantity;
  CartItem({
    required this.shoe,
    this.quantity = 1,
  });

  @override
  String toString() => 'CartItem(shoe: $shoe, quantity: $quantity)';
}
