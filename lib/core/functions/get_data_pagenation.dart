import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class GetDataPagenation {
  final String collectionName;
  final int dataLimit;
  final String feildSortedBy;
  GetDataPagenation(
      {required this.feildSortedBy,
      required this.collectionName,
      required this.dataLimit});

  final StreamController<List<DocumentSnapshot>> bmiController =
      StreamController<List<DocumentSnapshot>>.broadcast();
  final List<List<DocumentSnapshot>> _allPagedResults = [<DocumentSnapshot>[]];

  //  int dataLimit = limit;
  DocumentSnapshot? lastDocument;
  bool hasMoreData = true;

  void getBmi() {
    final CollectionReference bmiCollectionReference =
        FirebaseFirestore.instance.collection(collectionName);
    var pagechatQuery = bmiCollectionReference
        .orderBy(feildSortedBy, descending: true)
        .limit(dataLimit);

    if (lastDocument != null) {
      pagechatQuery = pagechatQuery.startAfterDocument(lastDocument!);
    }

    if (!hasMoreData) return;

    var currentRequestIndex = _allPagedResults.length;
    pagechatQuery.snapshots().listen(
      (snapshot) {
        if (snapshot.docs.isNotEmpty) {
          var generalBMIs = snapshot.docs.toList();

          var pageExists = currentRequestIndex < _allPagedResults.length;

          if (pageExists) {
            _allPagedResults[currentRequestIndex] = generalBMIs;
          } else {
            _allPagedResults.add(generalBMIs);
          }

          var allBMIs = _allPagedResults.fold<List<DocumentSnapshot>>(
              <DocumentSnapshot>[],
              (initialValue, pageItems) => initialValue..addAll(pageItems));

          bmiController.add(allBMIs);

          if (currentRequestIndex == _allPagedResults.length - 1) {
            lastDocument = snapshot.docs.last;
          }

          hasMoreData = generalBMIs.length == dataLimit;
        }
      },
    );
  }
}
