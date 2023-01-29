import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edoctor/screens/user/dashboard.dart';
import 'package:edoctor/screens/user/homescreen.dart';
import 'package:edoctor/screens/user/profile.dart';
import 'package:edoctor/utils/color_utils.dart';
import 'package:edoctor/utils/resuable-widgits.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class appointment extends StatefulWidget {
  appointment({Key? key}) : super(key: key);

  @override
  _appointmentState createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  String name = "name";
  String email = "email";
  String age = "Age";
  String phone = "Phone";

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _PhoneTextController = TextEditingController();
  TextEditingController _doctornameController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

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
    _PhoneTextController.text = phone;
    _ageTextController.text = age;
    _emailTextController.text = email;
    _userNameTextController.text = name;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 60, 158, 207),
        title: const Text("Doctor Appointment"),
        centerTitle: true,
      ),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your name:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                resuableTextField(
                    name, Icons.person_outline, true, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Email:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                resuableTextField(
                    email, Icons.person_outline, true, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Age:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                resuableTextField(age, Icons.account_balance_wallet_sharp, true,
                    _ageTextController),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Phone-no:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                resuableTextField(
                    phone, Icons.phone, true, _PhoneTextController),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Doctor's Name:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                resuableTextField("Enter the doctor's name",
                    Icons.person_outline, true, _doctornameController),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Time:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                resuableTextField("enter yoyr time of visit",
                    Icons.person_outline, true, _timeController),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Date:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 73, 119)),
                ),
                resuableTextField("enter your date of visit",
                    Icons.person_outline, true, _dateController),
                const SizedBox(
                  height: 20,
                ),
                pagebutton(context, "Book", () {
                  createappointment();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                })
              ],
            ),
          ))),
    );
  }

  void createappointment() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Userappointment")
        .doc(user!.uid)
        .set({
      "name": _userNameTextController.text,
      "email": _emailTextController.text,
      "Age": _ageTextController.text,
      "Phone": _PhoneTextController.text,
      "doctor": _doctornameController.text,
      "time": _timeController.text,
      "date": _dateController.text,
    });
  }
}
