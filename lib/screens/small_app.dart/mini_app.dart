import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/login.dart';
import 'package:flutter_application_1/screens/small_app.dart/home_Screen.dart';
import 'package:flutter_application_1/screens/small_app.dart/location_screen.dart';
import 'package:flutter_application_1/screens/small_app.dart/more_screen.dart';
import 'package:flutter_application_1/screens/small_app.dart/profile_screen.dart';
import 'package:flutter_application_1/screens/small_app.dart/settings_screen.dart';
import 'package:flutter_application_1/screens/Crud/crud_home_screen.dart';

class MiniApp extends StatefulWidget {
  MiniApp({super.key});

  @override
  State<MiniApp> createState() => _MiniAppState();
}

class _MiniAppState extends State<MiniApp> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Widget> widgets = [
    CrudHomeScreen(),
    ProfileScreen(),
    SettingsScreen(),
    LocationScreen(),
    MoreScreen(),
  ];
  int currentIndex = 0;
  void logOut() async {
    try {
      await auth.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginClass()),
        (value) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          currentIndex == 0
              ? 'Home'
              : currentIndex == 1
              ? 'Profile'
              : currentIndex == 2
              ? 'Settings'
              : currentIndex == 3
              ? 'Location'
              : 'More',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 30,

            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            globalKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      ),

      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 202, 206, 213),
        child: ListView(
          children: [
            ListTile(
              selected: currentIndex == 0,
              onTap: () {
                globalKey.currentState?.closeDrawer();
                setState(() {
                  currentIndex = 0;
                });
              },
              title: Text('Crud Home'),
              leading: Icon(Icons.home, color: Colors.lightBlue),
            ),

            ListTile(
              selected: currentIndex == 1,
              onTap: () {
                globalKey.currentState?.closeDrawer();
                setState(() {
                  currentIndex = 1;
                });
              },
              title: Text('Profile'),
              leading: Icon(Icons.person, color: Colors.lightBlue),
            ),

            ListTile(
              selected: currentIndex == 2,
              onTap: () {
                setState(() {
                  globalKey.currentState?.closeDrawer();
                  currentIndex = 2;
                });
              },
              title: Text('Settings'),
              leading: Icon(Icons.settings, color: Colors.lightBlue),
            ),

            ListTile(
              selected: currentIndex == 3,
              onTap: () {
                setState(() {
                  globalKey.currentState?.closeDrawer();
                  currentIndex = 3;
                });
              },
              title: Text('Location'),
              leading: Icon(Icons.location_city, color: Colors.lightBlue),
            ),

            ListTile(
              selected: currentIndex == 4,
              onTap: () {
                setState(() {
                  globalKey.currentState?.closeDrawer();
                  currentIndex = 4;
                });
              },
              title: Text('More'),
              leading: Icon(Icons.more, color: Colors.lightBlue),
            ),
            ElevatedButton(
              onPressed: () {
                logOut();
              },
              child: Text('LogOut'),
            ),
          ],
        ),
      ),
      body: widgets[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),

          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),

          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),

          BottomNavigationBarItem(
            label: 'location',
            icon: Icon(Icons.location_city_outlined),
          ),

          BottomNavigationBarItem(
            label: 'More',
            icon: Icon(Icons.more_rounded),
          ),
        ],
      ),
    );
  }
}
