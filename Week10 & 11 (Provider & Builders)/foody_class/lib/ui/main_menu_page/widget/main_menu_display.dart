import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fooody/change_notifiers/food_item_change_notifier.dart';
import 'package:fooody/services/fake_api_service.dart';
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
  //TODO 8 delete the line below this todo
  var categories = FakeApiService().categories;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    //TODO 9 create an instance of FoodItemChangeNotifier
    //TODO 10 assign the categories from the FoodItemChangeNotifier to a new variable called categories
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: categories == null
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
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return InkWell(
                            onTap: () {
                              //TODO 12 select the current menu category by using the current index of the listViewBuilder
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
                          //TODO 13 select the current menu category by using the current index of the pageViewBuilder
                        },
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        itemCount: categories.length,
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
