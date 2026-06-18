import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/BookCatalog/read_book_catalogue.dart';
import 'package:flutter_application_1/screens/Profile/profile_design.dart';
import 'package:flutter_application_1/screens/Profile/profile_screen.dart';
import 'package:flutter_application_1/screens/eCom/book.dart';
import 'package:flutter_application_1/screens/small_app.dart/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/screens/Authentication/login.dart';
import 'package:flutter_application_1/screens/Authentication/register.dart';
import 'package:flutter_application_1/screens/Crud/crud_home_screen.dart';
import 'package:flutter_application_1/screens/Crud/add_user.dart';
import 'package:flutter_application_1/screens/Splash/splash_screen.dart';
import 'package:flutter_application_1/screens/small_app.dart/mini_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //  home: AddUserClass(),

      // ++++++++++++++++++++++++Multi provider code in main.dart
      home:ProfileDesign (),
    );
    // home: ListViewClass(),
  }
}
