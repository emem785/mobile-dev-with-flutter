import 'package:flutter/material.dart';
import 'package:fooody/change_notifiers/cart_item_change_notifier.dart';
import 'package:fooody/change_notifiers/food_item_change_notifier.dart';
import 'package:fooody/services/api_service.dart';
import 'package:fooody/services/fake_api_service.dart';
import 'package:fooody/ui/food_item_page/food_item_page.dart';
import 'package:fooody/ui/login_page/login_page.dart';
import 'package:fooody/ui/main_menu_page/main_menu_page.dart';
import 'package:fooody/utils/styleguide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ui/register_page/register_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => FoodItemChangeNotifier(ApiService())),
        ChangeNotifierProvider(create: (_) => CartItemChangeNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => MainMenuPage(),
          "/login": (context) => LoginPage(),
          "/register": (context) => RegisterPage(),
          "/mainMenu": (context) => MainMenuPage(),
          "/foodItemPage": (context) => FoodItemPage()
        },
        theme: ThemeData(
            backgroundColor: Color(0xFFE5E5E5),
            textTheme: GoogleFonts.b612TextTheme(),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: labelStyle,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: buttonShape,
                padding: buttonPadding,
                minimumSize: buttonSize,
                backgroundColor: buttonColor,
                textStyle: buttonStyle,
                elevation: buttonElevation,
              ),
            ),
            primaryColor: Color(0xFFFF6D00),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Color(0xFFFF6D00),
            )),
      ),
    ),
  );
}
