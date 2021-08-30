import 'package:flutter/material.dart';
import 'package:fooody/ui/main_menu_page/widget/cart_icon.dart';
import 'package:fooody/ui/main_menu_page/widget/main_menu_display.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: MainMenuDisplay(),
    );
  }

}

