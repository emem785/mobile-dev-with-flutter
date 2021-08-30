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
        Consumer<CartItemChangeNotifier>(
          builder: (context, value, child) {
            final noOfItems = value.noOfItems;
            return noOfItems == 0
                ? SizedBox()
                : Positioned(
                    left: 13,
                    child: ClipOval(
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        height: 14,
                        width: 14,
                        child: Center(
                          child: Text(noOfItems.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11)),
                        ),
                      ),
                    ),
                  );
          },
        )
      ]),
    );
  }
}
