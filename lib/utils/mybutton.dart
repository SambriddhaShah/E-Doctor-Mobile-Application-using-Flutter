import 'package:edoctor/screens/doctor/doctorlist.dart';
import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;
  final String doctor1;
  final String doctor2;
  final String doctor3;
  final String doctor4;
  final String doctor5;
  final String subtext;

  const mybutton({
    Key? key,
    required this.iconImagePath,
    required this.buttonText,
    required this.doctor1,
    required this.doctor2,
    required this.doctor3,
    required this.doctor4,
    required this.doctor5,
    required this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 100,
        // width: 100,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500, blurRadius: 20, spreadRadius: 5)
            ]),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => doctorlist(
                    doctor1: doctor1,
                    doctor2: doctor2,
                    doctor3: doctor3,
                    doctor4: doctor4,
                    doctor5: doctor5,
                    subtext: subtext,
                  ),
                ),
              );
            },
            child: Image.asset(
              iconImagePath,
              // height: 100,
              // width: 100,
            )),
      ),
      const SizedBox(
        height: 7,
      ),
      Text(buttonText,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.blue[280]))
    ]);
  }
}
