// ToDo: will remove it
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class BmiStream extends StatefulWidget {
//   const BmiStream({super.key});

//   @override
//   BmiStreamState createState() => BmiStreamState();
// }

// class BmiStreamState extends State<BmiStream> {
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('bmi').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text("Loading");
//         }

//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data =
//                 document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['height']),
//               subtitle: Text(data['age']),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
