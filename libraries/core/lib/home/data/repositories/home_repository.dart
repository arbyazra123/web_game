import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared/shared.dart';

class HomeRepository {
  final homeCollection = FirebaseFirestore.instance.collection(gameCollection);

  Stream<List<DocumentSnapshot>> getGames() {
    return homeCollection.snapshots().map((snapshot) {
      print(snapshot.docs.length);
      return snapshot.docs.toList();
    });
  }
}
