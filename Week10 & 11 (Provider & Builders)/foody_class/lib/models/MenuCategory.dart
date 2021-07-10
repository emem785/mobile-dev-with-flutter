import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fooody/models/food_item.dart';

class MenuCategory {
  final FoodCategory category;
  final String svgName;
  final List<FoodItem> foodItems;
  bool isSelected;

  String get svgPath => "assets/svg/" + svgName + ".svg";

  MenuCategory({
    @required this.category,
    @required this.svgName,
    @required this.foodItems,
    this.isSelected = false,
  });
}

enum FoodCategory {
  Drink,
  Snacks,
  Bread,
  Treats,
  Foods,
}
