import 'package:flutter/animation.dart';

class Shoe {
  int id;
  String name;
  double price;
  List<Color> colors;
  String desc;
  int buyersNum;
  bool isFavorite;
  String cover;
  Shoe({
    required this.id,
    required this.name,
    required this.price,
    required this.colors,
    required this.desc,
    required this.buyersNum,
    required this.isFavorite,
    required this.cover,
  });

  @override
  String toString() {
    return 'Shoe(id: $id, name: $name, price: $price, colors: $colors, desc: $desc, buyersNum: $buyersNum, isFavorite: $isFavorite, cover: $cover)';
  }
}
