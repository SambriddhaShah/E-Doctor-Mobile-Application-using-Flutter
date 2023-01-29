import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edoctor/screens/user/editprofile.dart';
import 'package:edoctor/screens/user/homescreen.dart';
import 'package:edoctor/utils/color_utils.dart';
import 'package:edoctor/utils/resuable-widgits.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class profilescreen extends StatefulWidget {
  const profilescreen({Key? key}) : super(key: key);

  @override
  _profilescreenState createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  String name = "name";
  String email = "email";
  String age = "Age";
  String phone = "Phone";

  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.uid)
        .get();
    setState(() {
      name = vari.data()!['name'];
      email = vari.data()!['email'];
      age = vari.data()!['Age'];
      phone = vari.data()!['Phone'];
    });
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.brown,
                  child: Text(
                    name[0],
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  "Username:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                firebaseUIButton(
                  context,
                  name,
                  () {},
                ),
                const Text(
                  "Email:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                firebaseUIButton(
                  context,
                  email,
                  () {},
                ),
                const Text(
                  "Phone Number:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                firebaseUIButton(
                  context,
                  phone,
                  () {},
                ),
                const Text(
                  "Age:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                firebaseUIButton(
                  context,
                  age,
                  () {},
                ),
                pagebutton(context, "Edit Profile Info", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => editprofile(),
                    ),
                  );
                })
              ],
            ),
          ))),
    );
  }
}
