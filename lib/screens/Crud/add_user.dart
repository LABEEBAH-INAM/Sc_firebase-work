import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUserClass extends StatefulWidget {
  const AddUserClass({super.key});

  @override
  State<AddUserClass> createState() => _AddUserState();
}

class _AddUserState extends State<AddUserClass> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  final dbRefence = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add')),

      body: Form(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(height: 15),

            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: 'Email'),
            ),

            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                await dbRefence.doc(id).set({
                  'u_id': id,
                  'u_name': name.text,
                  'u_email': email.text,
                });
               
                Navigator.pop(context);
              },
              child: Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}
