import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edoctor/screens/user/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/color_utils.dart';
import '../../utils/resuable-widgits.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _PhoneTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              hexStringToColor("2a6f97"),
              hexStringToColor("61a5c2"),
              hexStringToColor("a9d6e5"),
            ],
          )),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                resuableTextField("Enter UserName", Icons.person_outline, true,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField("Enter Email Id", Icons.person_outline, true,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(
                    "Enter Age",
                    Icons.account_balance_wallet_sharp,
                    true,
                    _ageTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(
                    "Enter Phone", Icons.phone, true, _PhoneTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField("Enter Password", Icons.lock_outlined, false,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(
                  context,
                  "Sign Up",
                  () {
                    registerUser();
                    // registerUser().then((value) {
                    //   print('created a new account');
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => MyApp(),
                    //     ),
                    //   );
                    // }).onError((error, stackTrace) {
                    //   print('Error ${error.toString()}');
                    // });
                  },
                ),
              ],
            ),
          ))),
    );
  }

  Future registerUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = FirebaseAuth.instance.currentUser;

    auth
        .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
        .then((signedInUser) => FirebaseFirestore.instance
                .collection("Users")
                .doc(signedInUser.user!.uid)
                .set({
              "name": _userNameTextController.text,
              "email": _emailTextController.text,
              "Age": _ageTextController.text,
              "Phone": _PhoneTextController.text,
            }))
        .then((value) {
      print('created a new account');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
    }).onError((error, stackTrace) {
      print('Error ${error.toString()}');
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
