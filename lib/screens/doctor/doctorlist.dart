import 'package:flutter/material.dart';

import 'doctorinfo.dart';

class doctorlist extends StatelessWidget {
  final String doctor1;
  final String doctor2;
  final String doctor3;
  final String doctor4;
  final String doctor5;
  final String subtext;

  const doctorlist({
    Key? key,
    required this.doctor1,
    required this.doctor2,
    required this.doctor3,
    required this.doctor4,
    required this.doctor5,
    required this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list1 = [doctor1, doctor2, doctor3, doctor4, doctor5];
    final list2 = [subtext, subtext, subtext, subtext, subtext];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor List"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(146, 60, 158, 207),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
                color: Colors.white,
              ),
          itemCount: list1.length,
          itemBuilder: ((context, index) {
            return ListTile(
              onTap: (() {
                print('Item pressed.');
                print(index.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => doctorinfo(
                      doctorname: list1[index],
                      subtitle: list2[index],
                    ),
                  ),
                );
              }),
              title: Text(list1[index],
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[280])),
              subtitle: Text(subtext,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[280])),
              leading: CircleAvatar(
                backgroundColor: Colors.brown,
                child: Text(list1[index][4]),
              ),
              trailing: const Icon(
                Icons.info,
                color: Color.fromARGB(255, 5, 41, 70),
              ),
            );
          })),
    );
  }
}
