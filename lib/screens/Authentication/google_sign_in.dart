import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade400,
        fixedSize: Size(MediaQuery.of(context).size.width,52),
      ),
      icon: Image.asset('assets/google_logo.png', height: 24, width: 24),
      label: const Text('Continue with Google'),
    );
  }
}
