import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  final Map<String, dynamic> user;
  UpdateUser({super.key, required this.user});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  final dbRefence = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    name.text = widget.user['u_name'];
    email.text = widget.user['u_email'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Update')),

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
                await dbRefence.doc(widget.user['u_id']).update({
                  'u_name': name.text,
                  'u_email': email.text,
                });

                Navigator.pop(context);
              },
              child: Text('update User'),
            ),
          ],
        ),
      ),
    );
  }
}
