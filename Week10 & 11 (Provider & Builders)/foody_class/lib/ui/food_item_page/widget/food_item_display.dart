import 'package:flutter/material.dart';
import 'package:fooody/change_notifiers/cart_item_change_notifier.dart';
import 'package:fooody/change_notifiers/food_item_change_notifier.dart';
import 'package:fooody/models/food_item.dart';
import 'package:provider/provider.dart';

const radius = Radius.circular(30);

class FoodDisplay extends StatelessWidget {
  const FoodDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodItem =
        Provider.of<FoodItemChangeNotifier>(context).currentFoodItem;
    final _cartChangeNotifier =
        Provider.of<CartItemChangeNotifier>(context, listen: false);
    final noOfItems = Provider.of<CartItemChangeNotifier>(context).noOfItems;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Hero(
              tag: foodItem.name,
              child: ClipOval(
                child: Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(foodItem.imagePath),
                    fit: BoxFit.fill,
                  )),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 450,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: radius, topRight: radius),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vegetable Chicken",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Healthy & Delicious",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Text(
                      "Description",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    width: 250,
                    child: Text(
                      foodItem.desc,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () => _cartChangeNotifier.addItem(),
                            child: Text("Add To Cart")),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.favorite_border)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 390,
            right: 24,
            child: Text(
              "₦${foodItem.price}",
              style: TextStyle(color: Theme.of(context).primaryColor),
            )),
        Positioned(
          right: 24,
          bottom: 152,
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(),
              color: Color(0xFFFFE9F8),
            ),
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: Colors.black26),
                  onPressed: () => _cartChangeNotifier.addItem(),
                ),
                Text(noOfItems.toString()),
                IconButton(
                  icon:
                      Icon(Icons.remove_circle_outline, color: Colors.black26),
                  onPressed: () => _cartChangeNotifier.removeItem(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
