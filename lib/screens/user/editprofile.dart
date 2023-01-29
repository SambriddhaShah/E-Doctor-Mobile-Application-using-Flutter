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

class editprofile extends StatefulWidget {
  const editprofile({Key? key}) : super(key: key);

  @override
  _editprofileState createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  String name = "name";
  String email = "email";
  String age = "Age";
  String phone = "Phone";

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _PhoneTextController = TextEditingController();

  void updateData(String name, String age, String phone, String email) async {
    User? user = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.uid) // replace "userId" with the actual document ID
        .update({
      "name": name,
      "Age": age,
      "Phone": phone,
      "email": email,
    });
  }

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

  void deleteData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('Users').doc(user!.uid).delete();
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
                resuableTextField("Enter Your Password For Deleting Account",
                    Icons.password, true, _passwordTextController),
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
                        _emailTextController.text);

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
                deletebutton(context, 'Delete Account', () {})
              ],
            ),
          ))),
    );
  }

  void deleteuseraccount(String email, String pass) async {
    User? user = await FirebaseAuth.instance.currentUser;
    AuthCredential crenditial = EmailAuthProvider.credential(
        email: _emailTextController.text,
        password: _passwordTextController.text);
    await user?.reauthenticateWithCredential(crenditial).then((value) {
      value.user?.delete().then((res) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => signin()));
      }).onError((error, stackTrace) {
        print('Error: ${error.toString()}');
        Fluttertoast.showToast(msg: error.toString());
      });
      ;
    });
  }
}
