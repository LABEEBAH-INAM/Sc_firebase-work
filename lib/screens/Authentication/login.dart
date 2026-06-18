import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/register.dart';
// import 'package:flutter_application_1/screens/Authentication/google_sign_in.dart';
import 'package:flutter_application_1/screens/ForgotPassword/forgot_password.dart';
import 'package:flutter_application_1/screens/small_app.dart/mini_app.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginClass extends StatefulWidget {
  const LoginClass({super.key});

  @override
  State<LoginClass> createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginClass> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  void loginNow() async {
    setState(() {
      loading = true;
    });
    try {
      await auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MiniApp()),
        (value) => false,
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      loading = false;
    }
  }

  // void continueWithGooglee() async {
  //   // Fixed spelling
  //   String webClientId =
  //       '1059284167916-gg15dml65ib20p79r5ok0j3v2h8p7ied.apps.googleusercontent.com';

  //   try {
  //     setState(() {
  //       loading = true; // Start loading at the beginning
  //     });

  //     GoogleSignIn signIn = GoogleSignIn.instance;
  //     await signIn.initialize(serverClientId: webClientId);

  //     GoogleSignInAccount? account = await signIn.authenticate();

  //     // Added null check to prevent crashes
  //     if (account != null) {
  //       GoogleSignInAuthentication googleAuth = await account.authentication;

  //       final credential = GoogleAuthProvider.credential(
  //         idToken: googleAuth.idToken,
  //       );

  //       // Call this only once
  //       await auth.signInWithCredential(credential);

  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (context) => MiniApp()),
  //         (value) => false,
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text(e.toString())));
  //   } finally {
  //     setState(() {
  //       loading = false; // Always stop loading in finally block
  //     });
  //   }
  // }

  
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
  backgroundColor: const Color(0xFFFDF7FA),
  body: loading
      ? const Center(
          child: CircularProgressIndicator(
            color: Color(0xFFFF85BB),
          ),
        )
      : Form(
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
                  'Login Here',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D2D2D),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  'Welcome back to your bookstore',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(height: 35),

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
                  if (formKey.currentState!.validate()) {
                    loginNow();
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordClass(),
                    ),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFFFF85BB),
                  ),
                ),
              ),

              TextButton.icon(
                onPressed: () {
                },
                icon: const Icon(Icons.g_mobiledata, size: 35),
                label: const Text('Continue with Google'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black87,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterClass(),
                        ),
                      );
                    },
                    child: const Text(
                      'Register Here',
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
