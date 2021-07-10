import 'package:flutter/material.dart';

class CartItemChangeNotifier with ChangeNotifier {
  int _noOfItems = 0;

  int get noOfItems => _noOfItems;

  void removeItem() {
    if (noOfItems > 0) {
      _noOfItems -= 1;
      notifyListeners();
    }
  }

  void addItem() {
    _noOfItems += 1;
    notifyListeners();
  }
}
