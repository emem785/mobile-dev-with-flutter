import 'package:flutter/material.dart';
import 'package:fooody/models/MenuCategory.dart';
import 'package:fooody/models/food_item.dart';
import 'package:fooody/services/fake_api_service.dart';

class FoodItemChangeNotifier with ChangeNotifier {
  FoodItem _foodItem;
  MenuCategory _menuCategory;
  List<MenuCategory> _categories;

  FakeApiService fakeApiService;

  FoodItem get currentFoodItem => _foodItem;

  MenuCategory get currentMenuCategory => _menuCategory;

  List<MenuCategory> get categories => _categories;

  FoodItemChangeNotifier(FakeApiService apiService) {
    fakeApiService = apiService;
    getFoodItems();
  }

  void selectItem(FoodItem foodItem) {
    _foodItem = foodItem;
    notifyListeners();
  }

  void getFoodItems() async {
    _categories = await fakeApiService.getFoodItems();
    _menuCategory = _categories[0];
    _menuCategory.isSelected = true;
    notifyListeners();
  }

  void selectMenuCategory(int index) async {
    _menuCategory.isSelected = false;
    _menuCategory = _categories[index];
    _menuCategory.isSelected = true;
    notifyListeners();
  }
}
