import 'package:flutter/material.dart';
import 'package:fooody/models/MenuCategory.dart';
import 'package:fooody/models/food_item.dart';
import 'package:fooody/services/api_service.dart';
import 'package:fooody/services/fake_api_service.dart';

class FoodItemChangeNotifier with ChangeNotifier {
  FoodItems _foodItem;
  MenuCategory _menuCategory;
  List<MenuCategory> _categories;

  ApiService _apiService;

  FoodItems get currentFoodItem => _foodItem;

  MenuCategory get currentMenuCategory => _menuCategory;

  List<MenuCategory> get categories => _categories;

  FoodItemChangeNotifier(ApiService apiService) {
    _apiService = apiService;
    getFoodItems();
  }

  void selectItem(FoodItems foodItem) {
    _foodItem = foodItem;
    notifyListeners();
  }

  void getFoodItems() async {
    _categories = await _apiService.getCategories();
    _menuCategory = _categories[0];
    print(_menuCategory.foodItems);
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
