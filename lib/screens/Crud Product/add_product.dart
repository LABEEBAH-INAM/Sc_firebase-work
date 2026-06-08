import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Crud Product/product_crud_home_screen.dart';

class AddProductClass extends StatefulWidget {
  const AddProductClass({super.key});

  @override
  State<AddProductClass> createState() => _AddUserState();
}

class _AddUserState extends State<AddProductClass> {
  TextEditingController product_name = TextEditingController();
  TextEditingController product_description = TextEditingController();
  final dbRefence = FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),

      body: Form(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            TextFormField(
              controller: product_name,
              decoration: InputDecoration(hintText: 'Product Name'),
            ),
            SizedBox(height: 15),

            TextFormField(
              controller: product_description,
              decoration: InputDecoration(hintText: 'Product Description'),
            ),

            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                await dbRefence.doc(id).set({
                  'id': id,
                  'product_name': product_name.text,
                  'product_description': product_description.text,
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductCrudHomeScreen(),
                  ),
                );
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
