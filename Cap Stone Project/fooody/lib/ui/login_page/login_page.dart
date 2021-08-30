import 'package:flutter/material.dart';
import 'package:fooody/ui/login_page/widget/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.white),
        ),
      ),
      body: LoginForm(),
    );
  }
}
