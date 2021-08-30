import 'package:flutter/cupertino.dart';

class FoodItems {
  String desc;
  String imageName;
  String name;
  String price;
  String get imagePath => "assets/jpg/" + imageName + ".jpg";

  FoodItems({this.desc, this.imageName, this.name, this.price});

  FoodItems.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    imageName = json['imageName'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['imageName'] = this.imageName;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
