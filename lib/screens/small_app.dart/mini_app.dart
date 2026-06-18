import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/login.dart';
import 'package:flutter_application_1/screens/small_app.dart/home_Screen.dart';
import 'package:flutter_application_1/screens/small_app.dart/wishlist_screen.dart';
import 'package:flutter_application_1/screens/small_app.dart/orders_screen.dart';
import 'package:flutter_application_1/screens/small_app.dart/profile_screen.dart';
import 'package:flutter_application_1/screens/small_app.dart/discover_screen.dart';
import 'package:flutter_application_1/screens/Crud/crud_home_screen.dart';
import 'package:flutter_application_1/screens/Crud Product/product_crud_home_screen.dart';

class MiniApp extends StatefulWidget {
  MiniApp({super.key});

  @override
  State<MiniApp> createState() => _MiniAppState();
}

class _MiniAppState extends State<MiniApp> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Widget> widgets = [
    HomeScreen(),
    DiscoverScreen(),
    WishListScreen(),
    OrdersScreen(),
    ProfileScreen(),
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
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
              ? 'Discover'
              : currentIndex == 2
              ? 'WishList'
              : currentIndex == 3
              ? 'Orders'
              : 'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFF85BB),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF85BB), Color(0xFF00B7EB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            globalKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.white),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFF5F5F5),
        child: ListView(
          children: [
DrawerHeader(
  decoration: BoxDecoration(
    color: Color(0xFFFF85BB),
  ),
  child: Center(
    child: Image.asset(
      'assets/icons/app_icon.png',
      height: 120,
    ),
  ),
),
            SizedBox(height: 20),
            ListTile(
              selected: currentIndex == 0,
              onTap: () {
                globalKey.currentState?.closeDrawer();
                setState(() {
                  currentIndex = 0;
                });
              },
              title: Text(' Home'),
              leading: Icon(
                CupertinoIcons.house_fill,
                color: Color(0xFFFF85BB),
              ),
            ),
            ListTile(
              selected: currentIndex == 1,
              onTap: () {
                globalKey.currentState?.closeDrawer();
                setState(() {
                  currentIndex = 1;
                });
              },
              title: Text('Discover'),
              leading: Icon(CupertinoIcons.search, color: Color(0xFFFF85BB)),
            ),
            ListTile(
              selected: currentIndex == 2,
              onTap: () {
                setState(() {
                  globalKey.currentState?.closeDrawer();
                  currentIndex = 2;
                });
              },
              title: Text('WishList'),
              leading: Icon(
                CupertinoIcons.heart_fill,
                color: Color(0xFFFF85BB),
              ),
            ),
            ListTile(
              selected: currentIndex == 3,
              onTap: () {
                setState(() {
                  globalKey.currentState?.closeDrawer();
                  currentIndex = 3;
                });
              },
              title: Text('Orders'),
              leading: Icon(CupertinoIcons.bag_fill, color: Color(0xFFFF85BB)),
            ),
            ListTile(
              selected: currentIndex == 4,
              onTap: () {
                setState(() {
                  globalKey.currentState?.closeDrawer();
                  currentIndex = 4;
                });
              },
              title: Text('Profile'),
              leading: Icon(
                CupertinoIcons.person_fill,
                color: Color(0xFFFF85BB),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                logOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF85BB),
              ),
              child: Text('LogOut', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      
      body: Container(color: Color(0xFFF5F5F5), child: widgets[currentIndex]),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFFFF85BB),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(CupertinoIcons.house_fill),
          ),
          BottomNavigationBarItem(
            label: 'Discover',
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            label: 'WishList',
            icon: Icon(CupertinoIcons.heart_fill),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(CupertinoIcons.person_fill),
          ),
        ],
      ),
    );
  }
}
