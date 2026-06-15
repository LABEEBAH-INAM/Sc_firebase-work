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
      backgroundColor: const Color(0xFFFDF7FA),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFF85BB),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Forgot Password'),
      ),

      body: loading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xFFFF85BB)),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 90,
                      width: 90,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Reset Your Password',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2D2D2D),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Enter your email address and we will send you a password reset link.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),

                  const SizedBox(height: 30),

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
                  ),

                  const SizedBox(height: 25),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF85BB),
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      resetPAssword();
                    },
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
