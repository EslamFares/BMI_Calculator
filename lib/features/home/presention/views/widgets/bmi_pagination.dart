// TODO: will remove it
// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class BmiPagination extends StatefulWidget {
//   const BmiPagination({super.key});

//   @override
//   BmiPaginationState createState() => BmiPaginationState();
// }

// class BmiPaginationState extends State<BmiPagination> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.offset >=
//               (_scrollController.position.maxScrollExtent) &&
//           !_scrollController.position.outOfRange) {
//         _getBmi();
//       }
//     });
//   }

//   final StreamController<List<DocumentSnapshot>> _bmiController =
//       StreamController<List<DocumentSnapshot>>.broadcast();

//   final List<List<DocumentSnapshot>> _allPagedResults = [<DocumentSnapshot>[]];

//   static const int bmiLimit = 5;
//   DocumentSnapshot? _lastDocument;
//   bool _hasMoreData = true;

//   Stream<List<DocumentSnapshot>> listenToChatsRealTime() {
//     _getBmi();
//     return _bmiController.stream;
//   }

//   void _getBmi() {
//     final CollectionReference bmiCollectionReference =
//         FirebaseFirestore.instance.collection("bmi");
//     var pagechatQuery = bmiCollectionReference
//         .orderBy('time', descending: true)
//         .limit(bmiLimit);

//     if (_lastDocument != null) {
//       pagechatQuery = pagechatQuery.startAfterDocument(_lastDocument!);
//     }

//     if (!_hasMoreData) return;

//     var currentRequestIndex = _allPagedResults.length;
//     pagechatQuery.snapshots().listen(
//       (snapshot) {
//         if (snapshot.docs.isNotEmpty) {
//           var generalBMIs = snapshot.docs.toList();

//           var pageExists = currentRequestIndex < _allPagedResults.length;

//           if (pageExists) {
//             _allPagedResults[currentRequestIndex] = generalBMIs;
//           } else {
//             _allPagedResults.add(generalBMIs);
//           }

//           var allBMIs = _allPagedResults.fold<List<DocumentSnapshot>>(
//               <DocumentSnapshot>[],
//               (initialValue, pageItems) => initialValue..addAll(pageItems));

//           _bmiController.add(allBMIs);

//           if (currentRequestIndex == _allPagedResults.length - 1) {
//             _lastDocument = snapshot.docs.last;
//           }

//           _hasMoreData = generalBMIs.length == bmiLimit;
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<DocumentSnapshot>>(
//         stream: listenToChatsRealTime(),
//         builder: (ctx, bmiSnapshot) {
//           if (bmiSnapshot.hasData) {
//             final bmiDocs = bmiSnapshot.data!;
//             return ListView.builder(
//               controller: _scrollController,
//               // reverse: true,
//               itemBuilder: (ctx, i) {
//                 Map bmiData = bmiDocs[i].data() as Map;
//                 

//                 return Container(
//                     margin: const EdgeInsets.only(bottom: 5),
//                     height: 45,
//                     color: Colors.amber,
//                     child: Text(bmiData['height']));
//               },
//               itemCount: bmiDocs.length,
//             );
//           } else {
//             return const CircularProgressIndicator(
//               color: Colors.pink,
//             );
//           }
//         });
//   }
// }
