import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/login.dart';
import 'package:flutter_application_1/screens/small_app.dart/mini_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  void NextScreen() async {
    await Future.delayed(Duration(seconds: 3));

    if (auth.currentUser == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginClass()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MiniApp()),
      );
    }
  }

  @override
  void initState() {
    NextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(body: Center(child:
              Image.asset('assets/icons/app_icon.png', width: 150, height: 150),
)
    );
  }
}
