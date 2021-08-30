import 'food_item.dart';

class MenuCategory {
  String category;
  List<FoodItems> foodItems;
  String svgName;
  bool isSelected;
  String get svgPath => "assets/svg/" + svgName + ".svg";

  MenuCategory({this.category, this.foodItems, this.svgName, this.isSelected});

  MenuCategory.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    foodItems =
        List.from(json['foodItems']).map((v) => FoodItems.fromJson(v)).toList();
    svgName = json['svgName'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.foodItems != null) {
      data['foodItems'] = this.foodItems.map((v) => v.toJson()).toList();
    }
    data['svgName'] = this.svgName;
    return data;
  }
}
