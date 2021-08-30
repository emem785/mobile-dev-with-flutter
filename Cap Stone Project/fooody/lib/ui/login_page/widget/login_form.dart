import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool hideText = true;

  //TODO functions
  _obscureText() => setState(() => hideText = !hideText);

  _navigateToRegister() => Navigator.pushNamed(context, "/register");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      //TODO Scrollview
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                "Welcome back!",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "Please login to your account to continue",
                //TODO inherit theme
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.black26),
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  obscureText: hideText,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                        icon: !hideText
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: _obscureText),
                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text("Forgot password?"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("Login"))),
              ),
              Row(children: [
                Spacer(),
                Text("New user?"),
                SizedBox(width: 4),
                TextButton(
                  onPressed: _navigateToRegister,
                  child: Text(
                    "Create Account",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        //TODO primary color
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
                Spacer()
              ])
            ],
          ),
        ),
      ),
    );
  }
}
