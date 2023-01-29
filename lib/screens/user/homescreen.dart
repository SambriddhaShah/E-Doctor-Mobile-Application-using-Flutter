import 'package:edoctor/screens/user/editprofile.dart';
import 'package:edoctor/screens/user/appointmentview.dart';
import 'package:edoctor/screens/Main%20Screens/signin.dart';
import 'package:edoctor/screens/user/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'my_drawer_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.profile) {
      container = const profilescreen();
    } else if (currentPage == DrawerSections.events) {
      container = appointmentview();
    } else if (currentPage == DrawerSections.settings) {
      container = editprofile();
    } else if (currentPage == DrawerSections.logout) {
      container = FirebaseAuth.instance.signOut().then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const signin()));
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(146, 60, 158, 207),
        title: const Text("E-Doctor"),
        centerTitle: true,
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Profile", Icons.person_rounded,
              currentPage == DrawerSections.profile ? true : false),
          menuItem(3, "appointment", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Edit Profile", Icons.edit,
              currentPage == DrawerSections.settings ? true : false),
          Divider(),
          menuItem(5, "Logout", Icons.logout_outlined,
              currentPage == DrawerSections.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.profile;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.settings;
            } else if (id == 5) {
              currentPage = DrawerSections.logout;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  events,
  settings,
  logout,
  profile,
}
