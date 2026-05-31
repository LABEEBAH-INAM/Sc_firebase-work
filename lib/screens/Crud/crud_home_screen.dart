import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Crud/update_user.dart';
import 'package:flutter_application_1/screens/Crud/add_user.dart';

class CrudHomeScreen extends StatefulWidget {
  const CrudHomeScreen({super.key});

  @override
  State<CrudHomeScreen> createState() => _CrudHomeScreenState();
}

class _CrudHomeScreenState extends State<CrudHomeScreen> {
  final dbRefence = FirebaseFirestore.instance.collection('users');

  List<Map<String, dynamic>> users = [];

  void fetchdata() {
    dbRefence.snapshots().listen((data) {
      setState(() {
        users = data.docs.map((doc) => doc.data()).toList();
      });
    });
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          
          child: ListView(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(' Crud Gome Screen!!', style: TextStyle(fontSize: 30,backgroundColor: Colors.blueAccent, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Click below to perform Crud Operation', style: TextStyle(fontSize: 20,backgroundColor: Colors.black54, fontWeight: FontWeight.normal),),
              ),
              for (var user in users)
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateUser(user: user),
                      ),
                    );
                  },
                  title: Text(user['u_name']),
                  subtitle: Text(user['u_email']),
                  trailing: IconButton(
                    onPressed: () async {
                      await dbRefence.doc(user['u_id']).delete();
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),

          child: Center(
            child: ElevatedButton.icon(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserClass()),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Add User'),
              
            ),
          ),
        ),
      ],
    );
  }
}
