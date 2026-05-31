import 'package:flutter/material.dart';

class HomeScreenM extends StatelessWidget {
  const HomeScreenM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (appBar: AppBar(
      backgroundColor: Colors.blue,
    ),
body: Center(
  child: Text('Thsi is Home Page'),
),

    );
  }
}