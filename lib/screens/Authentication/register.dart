import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/login.dart';
import 'package:flutter_application_1/screens/small_app.dart/mini_app.dart';

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
    UserCredential userCredential =
        await auth.createUserWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    );

    String uid = userCredential.user!.uid;

    // ✅ SAVE PROFILE IN FIRESTORE
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'uid': uid,
      'name': name.text.trim(),
      'email': email.text.trim(),
      'address': "",
      'created_at': Timestamp.now(),
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MiniApp()),
    );
  }  catch (e) {
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
    return 
    Scaffold(
  backgroundColor: const Color(0xFFFDF7FA),
  body: Form(
    key: formKey,
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 40),

        Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 120,
            width: 120,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 20),

        Center(
          child: Text(
            'Register Here',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D2D2D),
            ),
          ),
        ),

        const SizedBox(height: 10),

        const Center(
          child: Text(
            'Create your bookstore account',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ),

        const SizedBox(height: 35),

        TextFormField(
          controller: name,
          decoration: InputDecoration(
            hintText: 'Your Name',
            prefixIcon: const Icon(
              Icons.person,
              color: Color(0xFFFF85BB),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Name';
            }
            return null;
          },
        ),

        const SizedBox(height: 20),

        TextFormField(
          controller: email,
          decoration: InputDecoration(
            hintText: 'Your Email',
            prefixIcon: const Icon(
              Icons.email,
              color: Color(0xFFFF85BB),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Email';
            }
            return null;
          },
        ),

        const SizedBox(height: 20),

        TextFormField(
          controller: password,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Your Password',
            prefixIcon: const Icon(
              Icons.lock,
              color: Color(0xFFFF85BB),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Password';
            }
            return null;
          },
        ),

        const SizedBox(height: 30),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF85BB),
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              RegisterNow();
            }
          },
          child: const Text(
            'Register',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account?',
              style: TextStyle(color: Colors.black87),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFFFF85BB),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);
  }
}
