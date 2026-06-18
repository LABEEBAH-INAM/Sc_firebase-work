// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ProfileScreenGenuine extends StatefulWidget {
//   const ProfileScreenGenuine({super.key});

//   @override
//   State<ProfileScreenGenuine> createState() => _ProfileScreenGenuineState();
// }

// class _ProfileScreenGenuineState extends State<ProfileScreenGenuine> {
//   final name = TextEditingController();
//   final email = TextEditingController();
//   final shippingAddress = TextEditingController();
//   final paymentMethod = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   bool loading = false;

//   int paymentSelected = 0;
//   List<String> paymnetMethods = ['Cash on Delivery', 'Card'];

//   final uid = FirebaseAuth.instance.currentUser!.uid;

//   Future<void> updateProfile() async {
//     setState(() {});
//     try {
//       await db.collection('users').doc(uid).update({
//         'name': name.text,
//         'email': email.text,
//         'shippingAddress': shippingAddress.text,
//         'paymentMethod': paymnetMethods[paymentSelected],
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(e.toString())));
//     } finally {
//       setState(() {
//         loading = false;
//       });
//     }

//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(const SnackBar(content: Text("Profile Updated")));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("My Profile")),

//       body: StreamBuilder(
//         stream: db.collection('users').doc(uid).snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           var data = snapshot.data!.data() as Map<String, dynamic>;

//           name.text = data['name'] ?? "";
//           email.text = data['email'] ?? "";
//           shippingAddress.text = data['shippingAddress'] ?? "";
//           paymentMethod.text = data['paymentMethod'] ?? "";

//           return ListView.builder(
//             itemCount: snapshot.data!.length,

//             itemBuilder: ((context, index) {
//             return   Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: name,
//                   decoration: const InputDecoration(labelText: "Name"),
//                 ),

//                 TextFormField(
//                   controller: email,
//                   decoration: const InputDecoration(labelText: "email"),
//                 ),

//                 TextFormField(
//                   controller: shippingAddress,
//                   decoration: const InputDecoration(labelText: "Address"),
//                 ),

//                 DropdownButtonFormField<int>(
//                   value: paymentSelected,
//                   decoration: InputDecoration(
//                     labelText: 'Select Payment Method',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Icon(Icons.payment_outlined),
//                   ),

//                   onChanged: (value) {
//                     setState(() {
//                       paymentSelected = value!;
//                     });
//                   },

//                   items: [
//                     for (int i = 0; i < paymnetMethods.length; i++)
//                       DropdownMenuItem<int>(
//                         value: i,
//                         child: Text(paymnetMethods[i]),
//                       ),
//                   ],
//                 ),

//                 const SizedBox(height: 20),

//                 ElevatedButton(
//                   onPressed: updateProfile,
//                   child: const Text("Update Profile"),
//                 ),
//               ],
//             ),
//           );
        
//           }))
        
//         },
//       ),
//     );
//   }
// }
