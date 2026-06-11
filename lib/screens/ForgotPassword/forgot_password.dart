import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordClass extends StatefulWidget {
  const ForgotPasswordClass({super.key});

  @override
  State<ForgotPasswordClass> createState() => _ForgotPasswordClassState();
}

class _ForgotPasswordClassState extends State<ForgotPasswordClass> {
  TextEditingController email = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  void resetPAssword() async {
    setState(() {
      loading = true;
    });
    try {
      await auth.sendPasswordResetEmail(email: email.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please check your email'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot PAssword'),
      backgroundColor: Colors.blueAccent,),
      body: loading?Center(child: CircularProgressIndicator(),):
      Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: 'Email:'),
            ),
            ElevatedButton(
              onPressed: () {
                resetPAssword();
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
