import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edoctor/screens/user/dashboard.dart';
import 'package:edoctor/screens/user/homescreen.dart';
import 'package:edoctor/screens/Main%20Screens/signin.dart';
import 'package:edoctor/screens/user/profile.dart';
import 'package:edoctor/utils/color_utils.dart';
import 'package:edoctor/utils/resuable-widgits.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class editappointment extends StatefulWidget {
  const editappointment({Key? key}) : super(key: key);

  @override
  _editappointmentState createState() => _editappointmentState();
}

class _editappointmentState extends State<editappointment> {
  String name = "name";
  String email = "email";
  String age = "Age";
  String phone = "Phone";
  String doctor = 'doctor';
  String date = 'date';
  String time = 'time';

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _PhoneTextController = TextEditingController();
  TextEditingController _doctornameController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  void updateData(String name, String age, String phone, String email,
      String doctor, String date, String time) async {
    User? user = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("Userappointment")
        .doc(user!.uid) // replace "userId" with the actual document ID
        .update({
      "name": name,
      "Age": age,
      "Phone": phone,
      "email": email,
      "doctor": doctor,
      "date": date,
      "time": time,
    });
  }

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

  void deleteData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Userappointment')
        .doc(user!.uid)
        .delete();
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
    _doctornameController.text = doctor;
    _dateController.text = date;
    _timeController.text = time;
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
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(
                    name, Icons.person_outline, true, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(
                    email, Icons.person_outline, true, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(age, Icons.account_balance_wallet_sharp, true,
                    _ageTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(
                    phone, Icons.phone, true, _PhoneTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(
                    doctor, Icons.password, true, _doctornameController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(date, Icons.password, true, _dateController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(time, Icons.password, true, _timeController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(
                  context,
                  "Edit",
                  () {
                    updateData(
                        _userNameTextController.text,
                        _ageTextController.text,
                        _PhoneTextController.text,
                        _emailTextController.text,
                        _doctornameController.text,
                        _dateController.text,
                        _timeController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                pagebutton(context, "Cancel", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                }),
                deletebutton(context, 'Delete Appointment', () {
                  deleteData();
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
}
