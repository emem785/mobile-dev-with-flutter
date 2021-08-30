import 'package:fooody/models/MenuCategory.dart';
import 'package:fooody/models/food_item.dart';

class FakeApiService {
  Future<List<MenuCategory>> getFoodItems() async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }
}
