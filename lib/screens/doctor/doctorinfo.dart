import 'package:edoctor/screens/appointment/appointment.dart';
import 'package:edoctor/screens/doctor/doctorlist.dart';
import 'package:edoctor/utils/resuable-widgits.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';

class doctorinfo extends StatelessWidget {
  final String doctorname;
  final String subtitle;

  const doctorinfo({
    Key? key,
    required this.doctorname,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(146, 60, 158, 207),
        title: const Text("Doctor Information"),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                hexStringToColor("2a6f97"),
                hexStringToColor("61a5c2"),
                hexStringToColor("a9d6e5"),
              ],
            ),
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundImage: const NetworkImage(
                    'https://images.unsplash.com/photo-1530533718754-001d2668365a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                radius: 80,
                backgroundColor: Color.fromARGB(255, 1, 34, 61),
                child: Text(
                  doctorname[4],
                  style: const TextStyle(color: Colors.white, fontSize: 70),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          doctorname,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                hexStringToColor("2a6f97"),
                hexStringToColor("61a5c2"),
                hexStringToColor("a9d6e5"),
              ],
            ),
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)),
          ),
          child: const Center(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    'A doctor is a medical professional who is trained and licensed to practice medicine. This includes diagnosing and treating illnesses and injuries, prescribing medications, and providing preventive care and health education to patients. To become a doctor, one must complete a rigorous education and training program, including a four-year undergraduate degree, four years of medical school, and a minimum of three years of supervised residency training. Additionally, doctors must pass a licensing examination to practice in their state. Some doctors choose to specialize in a particular field of medicine, such as pediatrics, surgery, or psychiatry, and may complete additional training and certification in that field.',
                    style: TextStyle(fontSize: 15))),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          child: pagebutton(context, "Book Appointment", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => appointment()),
            );
          }),
        )
      ]),
    );
  }
}
