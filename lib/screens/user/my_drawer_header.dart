import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
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
      print(name);
      print(email);
    });
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            hexStringToColor("2a6f97"),
            hexStringToColor("61a5c2"),
            hexStringToColor("a9d6e5"),
          ],
        ),
      ),
      // color: Colors.white10,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.brown,
              child: Text(
                name[0],
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              color: Color.fromARGB(255, 2, 29, 71),
              fontSize: 25,
            ),
          ),
          Text(
            email,
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
