import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen_m.dart';

class RegisterClass extends StatefulWidget {
  const RegisterClass({super.key});

  @override
  State<RegisterClass> createState() => _RegisterClassState();
}

class _RegisterClassState extends State<RegisterClass> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  void RegisterNow() async {
    setState(() {
      loading = true;
    });
    try {
      await auth.createUserWithEmailAndPassword(
        
        email: email.text,
        password: password.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreenM()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            SizedBox(height: 20),
            Text(
              'Register here',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 20),

            TextFormField(
              controller: name,
              decoration: InputDecoration(hintText: 'YOur Name:'),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Name:';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),

            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: 'YOur email:'),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Email:';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),

            TextFormField(
              controller: password,
              decoration: InputDecoration(hintText: 'YOur password:'),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter PAssword:';
                }
                return null;
              },
            ),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              if(formKey.currentState!.validate()){
                   RegisterNow();
              }
            },
             child:Text('Register') )
          ],
        ),
      ),
    );
  }
}
