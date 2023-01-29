import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edoctor/screens/appointment/editappointment.dart';
import 'package:edoctor/screens/user/editprofile.dart';
import 'package:edoctor/screens/user/homescreen.dart';
import 'package:edoctor/utils/color_utils.dart';
import 'package:edoctor/utils/resuable-widgits.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class appointmentview extends StatefulWidget {
  const appointmentview({Key? key}) : super(key: key);

  @override
  _appointmentviewState createState() => _appointmentviewState();
}

class _appointmentviewState extends State<appointmentview> {
  String name = "name";
  String email = "email";
  String age = "Age";
  String phone = "Phone";
  String doctor = 'doctor';
  String date = 'date';
  String time = 'time';

  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Userappointment")
        .doc(user!.uid)
        .get();
    setState(() {
      name = vari.data()!['name'];
      email = vari.data()!['email'];
      age = vari.data()!['Age'];
      phone = vari.data()!['Phone'];
      doctor = vari.data()!['doctor'];
      time = vari.data()!['time'];
      date = vari.data()!['date'];
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
                const Text("Appointment You've Taken",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 17, 66, 107))),
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
                const Text(
                  "Doctor Name:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                firebaseUIButton(
                  context,
                  doctor,
                  () {},
                ),
                const Text(
                  "Time To Visit:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                firebaseUIButton(
                  context,
                  time,
                  () {},
                ),
                const Text(
                  "Date Of Visit:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                firebaseUIButton(
                  context,
                  date,
                  () {},
                ),
                pagebutton(context, "Edit Appointment", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => editappointment(),
                    ),
                  );
                })
              ],
            ),
          ))),
    );
  }
}
