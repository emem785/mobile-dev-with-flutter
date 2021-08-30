import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fooody/change_notifiers/food_item_change_notifier.dart';
import 'package:fooody/ui/main_menu_page/widget/CategoryTile.dart';
import 'package:fooody/ui/main_menu_page/widget/cart_icon.dart';
import 'package:fooody/ui/main_menu_page/widget/category_page.dart';
import 'package:provider/provider.dart';

class MainMenuDisplay extends StatefulWidget {
  const MainMenuDisplay({Key key}) : super(key: key);

  @override
  _MainMenuDisplayState createState() => _MainMenuDisplayState();
}

class _MainMenuDisplayState extends State<MainMenuDisplay> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final _changeNotifier = Provider.of<FoodItemChangeNotifier>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _changeNotifier.categories == null
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Positioned(right: 8, top: 32, child: CartIcon()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 150),
                    Text(
                      "Menu",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 24),
                    Container(
                      height: 64,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _changeNotifier.categories.length,
                        itemBuilder: (context, index) {
                          final category = _changeNotifier.categories[index];
                          return InkWell(
                            onTap: () {
                              _changeNotifier.selectMenuCategory(index);
                              _pageController.jumpToPage(index);
                            },
                            child: CategoryTile(menuCategory: category),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 32),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (value) {
                          _changeNotifier.selectMenuCategory(value);
                        },
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        itemCount: _changeNotifier.categories.length,
                        itemBuilder: (context, index) {
                          return CategoryPage();
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
