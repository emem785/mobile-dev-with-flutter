import 'package:flutter/material.dart';
import 'package:fooody/ui/register_page/widget/RegisterForm.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(gapPadding: 0.1))),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.white),
          ),
        ),
        body: RegisterForm(),
      ),
    );
  }
}
