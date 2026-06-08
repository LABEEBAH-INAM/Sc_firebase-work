import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateProduct extends StatefulWidget {
  final Map<String, dynamic> product;
  const UpdateProduct({super.key, required this.product});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController product_name = TextEditingController();
  TextEditingController product_description = TextEditingController();
  final dbRefence = FirebaseFirestore.instance.collection('products');

  @override
  void initState() {
    product_name.text = widget.product['product_name'];
    product_description.text = widget.product['product_description'];
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
                await dbRefence.doc(widget.product['id']).update({
                  'product_name': product_name.text,
                  'product_description': product_description.text,
                });

                Navigator.pop(context);
              },
              child: Text('update Product'),
            ),
          ],
        ),
      ),
    );
  }
}
