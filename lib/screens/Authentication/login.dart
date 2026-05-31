import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/register.dart';
import 'package:flutter_application_1/screens/ForgotPassword/forgot_password.dart';
import 'package:flutter_application_1/screens/home_screen_m.dart';
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
      auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MiniApp()),
        (value) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      loading = false;
    }
  }

  void continueWitGoogle() async {
    String webClientID =
        '1059284167916-gg15dml65ib20p79r5ok0j3v2h8p7ied.apps.googleusercontent.com';
    try {
      GoogleSignIn signIn = GoogleSignIn.instance;
      await signIn.initialize(serverClientId: webClientID);
      GoogleSignInAccount account = await signIn.authenticate();
      GoogleSignInAuthentication googleAuth = account.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      setState(() {
        loading = true;
      });

      await auth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (Context) => MiniApp()),
        (value) => false,
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
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.all(15),
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Login here',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 20),

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
                  SizedBox(height: 20),

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

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginNow();
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (Context) => ForgotPasswordClass(),
                        ),
                      );
                    },
                    child: Text('Forgot Password?'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordClass(),
                        ),
                      );
                    },
                    child: Text('Continue with google'),
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterClass(),
                            ),
                          );
                        },
                        child: Text('Register here..'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
