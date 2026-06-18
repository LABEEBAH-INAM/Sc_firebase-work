import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserBookList extends StatelessWidget {
  UserBookList({super.key});

  final CollectionReference books =
      FirebaseFirestore.instance.collection('books');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        centerTitle: true,
      ),

      body: StreamBuilder(
        stream: books.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Books Available"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];

              return Card(
                margin: const EdgeInsets.all(10),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Title: ${doc['title']}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text("Author: ${doc['author']}"),
                      Text("Genre: ${doc['genre']}"),
                      Text("Price: ${doc['price']}"),

                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}