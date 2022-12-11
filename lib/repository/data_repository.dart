import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final CollectionReference skates =
      FirebaseFirestore.instance.collection('skate');

  Stream<QuerySnapshot> getSkateStream() {
    return skates.snapshots();
  }
}
