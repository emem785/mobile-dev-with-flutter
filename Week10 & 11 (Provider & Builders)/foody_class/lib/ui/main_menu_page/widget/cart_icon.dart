import 'package:flutter/material.dart';
import 'package:fooody/change_notifiers/cart_item_change_notifier.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Stack(children: [
        Icon(Icons.shopping_cart_outlined, size: 30, color: Colors.black),
        Positioned(
          left: 13,
          child: ClipOval(
            child: Container(
              child: Center(
                /*
                TODO 1 Wrap text widget with Consumer Widget , Observe data from CartItemChangeNotifier 
                TODO & Change value accodrding to noOfItems
                */
                child: Text(
                  "3",
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
              color: Theme.of(context).primaryColor,
              height: 14,
              width: 14,
            ),
          ),
        ),
      ]),
    );
  }
}
