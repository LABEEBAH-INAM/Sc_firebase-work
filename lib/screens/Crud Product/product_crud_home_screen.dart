import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Crud Product/add_product.dart';
import 'package:flutter_application_1/screens/Crud Product/update_product.dart';

class ProductCrudHomeScreen extends StatefulWidget {
  const ProductCrudHomeScreen({super.key});

  @override
  State<ProductCrudHomeScreen> createState() => _ProductCrudHomeScreenState();
}

class _ProductCrudHomeScreenState extends State<ProductCrudHomeScreen> {
  final dbRefence = FirebaseFirestore.instance.collection('products');

  List<Map<String, dynamic>> products = [];

  void fetchdata() {
    dbRefence.snapshots().listen((data) {
      setState(() {
        products = data.docs.map((doc) => doc.data()).toList();
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
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.amber,
),
body: Padding(padding: EdgeInsets.all(10),
child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' Crud Operation on Products!!',
                    style: TextStyle(
                      fontSize: 30,
                      backgroundColor: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Click below to perform Crud Operation',
                    style: TextStyle(
                      fontSize: 20,
                      backgroundColor: Colors.black54,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                for (var product in products)
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateProduct(product: product),
                        ),
                      );
                    },
                    title: Text(product['product_name'] ?? 'No Name'),
                    subtitle: Text(product['description'] ?? 'NoEmail'),
                    trailing: IconButton(
                      onPressed: () async {
                        await dbRefence.doc(product['u_id']).delete();
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),

          child: Center(
            child: ElevatedButton.icon(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductClass()),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Add Product'),
            ),
          ),
        ),
      ],
    )
  ,),
      
    );
  }
}
