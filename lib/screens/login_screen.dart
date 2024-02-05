import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter/constants.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamed(context, ChatScreen.id);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    login();
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
