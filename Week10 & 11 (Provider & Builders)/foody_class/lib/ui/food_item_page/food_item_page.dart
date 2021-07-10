import 'package:flutter/material.dart';
import 'package:fooody/ui/food_item_page/widget/food_item_display.dart';

class FoodItemPage extends StatelessWidget {
  const FoodItemPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: FoodDisplay(),
    );
  }
}
