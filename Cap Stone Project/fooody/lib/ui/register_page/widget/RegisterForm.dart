import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool hideText = true;

  //TODO functions
  _obscureText() => setState(() => hideText = !hideText);
  _navigateToLogin() => Navigator.pushNamed(context, "/login");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      //TODO Add scrollview
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text("Create Account",
                  style: Theme.of(context).textTheme.headline5),
              Text(
                "Please create an account to continue",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.black26),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Full Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        //TODO toggle button
                        icon: !hideText
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: _obscureText,
                      )),
                  obscureText: hideText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Create Account")),
                ),
              ),
              Row(children: [
                Spacer(),
                Text("Existing user?"),
                SizedBox(width: 4),
                TextButton(
                  onPressed: _navigateToLogin,
                  child: Text(
                    "Login",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        //TODO primary color
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
                Spacer(),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
