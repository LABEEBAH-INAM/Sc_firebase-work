import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Crud/crud_home_screen.dart';
import 'package:flutter_application_1/screens/eCom/book.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:eCommerceBook(),
    );
  }
}