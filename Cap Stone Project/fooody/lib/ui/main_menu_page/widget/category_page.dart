import 'package:flutter/material.dart';
import 'package:fooody/change_notifiers/food_item_change_notifier.dart';
import 'package:fooody/models/food_item.dart';
import 'package:fooody/services/fake_api_service.dart';
import 'package:fooody/ui/main_menu_page/widget/food_item_tile.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key key}) : super(key: key);

  _navigateToFoodItem(BuildContext context, FoodItems foodItem) {
    Provider.of<FoodItemChangeNotifier>(context, listen: false)
        .selectItem(foodItem);
    Navigator.pushNamed(context, "/foodItemPage");
  }

  @override
  Widget build(BuildContext context) {
    final menuCategory =
        Provider.of<FoodItemChangeNotifier>(context).currentMenuCategory;
    final foodList = menuCategory.foodItems;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: GridView.builder(
        itemCount: foodList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          mainAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          return Consumer<FoodItemChangeNotifier>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () => _navigateToFoodItem(context, foodList[index]),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: FoodItemTile(foodItem: foodList[index]),
                  width: 164,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
