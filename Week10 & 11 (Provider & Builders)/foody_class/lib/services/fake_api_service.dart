import 'package:fooody/models/MenuCategory.dart';
import 'package:fooody/models/food_item.dart';

const foodItems = [
  FoodItem(
    name: "Egusi",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    price: "10000",
    imageName: "egusi",
  ),
  FoodItem(
    name: "Okro",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    price: "5000",
    imageName: "okro",
  ),
  FoodItem(
    name: "Banga",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    price: "4300",
    imageName: "banga",
  ),
  FoodItem(
    name: "Ogbono",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    price: "3500",
    imageName: "ogbono",
  ),
  FoodItem(
    name: "Abak",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    price: "7500",
    imageName: "abak",
  ),
  FoodItem(
    name: "Gbegiri",
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    price: "4000",
    imageName: "gbegiri",
  ),
];


class FakeApiService {
  final categories = [
    MenuCategory(
        category: FoodCategory.Foods, svgName: "food", foodItems: foodItems),
    MenuCategory(
        category: FoodCategory.Bread, svgName: "bread", foodItems: foodItems.reversed.toList()),
    MenuCategory(
        category: FoodCategory.Snacks, svgName: "snack", foodItems: foodItems),
    MenuCategory(
        category: FoodCategory.Treats, svgName: "treat", foodItems: foodItems.reversed.toList()),
    MenuCategory(
        category: FoodCategory.Drink, svgName: "drink", foodItems: foodItems),
  ];

  Future<List<MenuCategory>> getFoodItems() async {
    await Future.delayed(const Duration(seconds: 1));
    return categories;
  }
}
