import 'package:flutter/cupertino.dart';

class FoodItem {
  final String name;
  final String desc;
  final String price;
  final String imageName;

  String get imagePath => "assets/jpg/$imageName.jpg";

  const FoodItem({
    @required this.name,
    @required this.desc,
    @required this.price,
    @required this.imageName,
  });
}
