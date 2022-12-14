import 'package:authentication_page/net/flutterfire.dart';
import 'package:authentication_page/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:authentication_page/main.dart';

class Authentication extends StatefulWidget {
  Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color.fromARGB(255, 216, 174, 190)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _emailField,
              decoration: InputDecoration(
                  hintText: "something@email.com",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 35),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _passwordField,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 35),
          Container(
            width: 200,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                (15.0),
              ),
              color: Colors.white,
            ),
            child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await register(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => HomePage()),
                      ),
                    );
                  }
                },
                child: Text("Register")),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 35),
          Container(
            width: 200,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                (15.0),
              ),
              color: Colors.white,
            ),
            child: MaterialButton(
              onPressed: () async {
                bool shouldNavigate =
                    await signIn(_emailField.text, _passwordField.text);
                if (shouldNavigate) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => HomePage()),
                    ),
                  );
                }
              },
              child: Text("Log in"),
            ),
          ),
        ],
      ),
    ));
  }
}
