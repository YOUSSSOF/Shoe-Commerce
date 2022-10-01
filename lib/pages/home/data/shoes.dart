import 'dart:math';
import 'package:ecommerce/network/models/shoe.dart';
import 'package:faker/faker.dart';
import 'package:flutter/animation.dart';

Faker faker = Faker();
Random random = Random();
List<Color> randomColors() {
  List<Color> colors = [];
  for (var i = 0; i < 5; i++) {
    colors
        .add(Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));
  }
  return colors;
}

Shoe randomShoe(int id, String cover) {
  return Shoe(
    id: id,
    name: faker.lorem.words(2).join(' '),
    price: random.nextDouble() * 500,
    colors: randomColors(),
    desc: faker.lorem.sentences(5).join('.'),
    buyersNum: random.nextInt(200),
    isFavorite: random.nextBool(),
    cover: cover,
  );
}

List<Shoe> all = [
  randomShoe(1, 'assets/images/1.jpg'),
  randomShoe(2, 'assets/images/2.jpg'),
  randomShoe(3, 'assets/images/3.jpg'),
  randomShoe(4, 'assets/images/4.jpg'),
  randomShoe(5, 'assets/images/5.jpg'),
  randomShoe(6, 'assets/images/7.jpg'),
  randomShoe(7, 'assets/images/6.jpg'),
  randomShoe(8, 'assets/images/8.jpg'),
  randomShoe(9, 'assets/images/9.jpg'),
  randomShoe(10, 'assets/images/10.jpg'),
];
List<Shoe> recent = all.take(6).toList();
