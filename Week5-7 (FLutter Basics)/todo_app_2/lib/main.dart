import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_2/add_task_page.dart';

void main() {
  runApp(MaterialApp(
    home: AddTask(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Every color in flutter starts with the value 0xFF then place the hex code afterwards
  Color backgroundColor = Color(0xFF1B87A9);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTask()));
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Color(0xff1411C7),
            size: 32.0,
          ),
        ),
        appBar: AppBar(
          leading: SvgPicture.asset("assets/images/hourglass_empty.svg"),
          backgroundColor: Colors.white,
          //actions is for widgets at extreme right
          elevation: 16.0,
          actions: [
            //Always wrap Icon data With Icon widget
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.delete,
                /*
                Moving true shades you can use different colors e.g Colors.blue[50]
                 */
                color: Color(0xffD9D3D3),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
