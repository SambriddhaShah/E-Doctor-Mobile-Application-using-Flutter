import 'dart:ui';

import 'package:edoctor/screens/user/homescreen.dart';
import 'package:edoctor/screens/Main%20Screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:edoctor/utils/resuable-widgits.dart';
import 'package:edoctor/utils/color_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("2a6f97"),
              hexStringToColor("61a5c2"),
              hexStringToColor("a9d6e5"),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "images/image3.png",
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(
                  height: 30,
                ),
                resuableTextField("Enter Username", Icons.person_outline, true,
                    _emailTextController),
                const SizedBox(
                  height: 30,
                ),
                resuableTextField("Enter Password", Icons.lock_outline, false,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "SignIn", () {
                  print("SignIn tapped");
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    );
                  }).onError((error, stackTrace) {
                    print('Error: ${error.toString()}');
                    Fluttertoast.showToast(msg: error.toString());
                  });
                }),
                signUpOption(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
