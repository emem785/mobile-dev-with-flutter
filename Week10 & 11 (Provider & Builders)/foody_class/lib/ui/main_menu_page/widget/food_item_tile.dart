import 'package:flutter/material.dart';
import 'package:fooody/change_notifiers/cart_item_change_notifier.dart';
import 'package:fooody/models/food_item.dart';
import 'package:provider/provider.dart';

class FoodItemTile extends StatelessWidget {
  final FoodItem foodItem;

  const FoodItemTile({
    Key key,
    @required this.foodItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Hero(
          tag: foodItem.name,
          child: ClipOval(
            child: Image.asset(
              foodItem.imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          )),
      Text(foodItem.name),
      Text("Healthy & Delicious"),
      SizedBox(height: 16),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("₦${foodItem.price}",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            )),
        InkWell(
          child: Icon(
            Icons.add_circle_outline,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          onTap: () {
            Provider.of<CartItemChangeNotifier>(context,listen: false).addItem();
          },
        )
      ])
    ]);
  }
}
