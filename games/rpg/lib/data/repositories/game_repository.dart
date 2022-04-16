import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class GameRepository {
  final String gameId;
  DocumentReference get collection =>
      FirebaseFirestore.instance.collection(gameCollection).doc(gameId);
  CollectionReference get gameplayReference =>
      FirebaseFirestore.instance.collection(gameplayCollection);
  CollectionReference get roomReference =>
      FirebaseFirestore.instance.collection(roomCollection);

  GameRepository(this.gameId);

  Future<DocumentSnapshot> isUserHasRoom(BuildContext context) async {
    DocumentSnapshot existingRoom;
    QuerySnapshot<Map<String, dynamic>> result = await roomReference.get();
    if (result.docs.isNotEmpty) {
      result.docs.forEach(
        (element) {
          if (element.data()['participant'] != null &&
              element.data()['participant'].isNotEmpty) {
            String userId = UserProvider.of(context).user.email;
            var checking = (element.data()['participant'] as List).firstWhere(
              (element) => element == userId,
              orElse: () => null,
            );
            if (checking != null) {
              existingRoom = element;
            }
          }
        },
      );
    }
    return existingRoom;
  }

  Stream<DocumentSnapshot> streamGame() {
    return collection.snapshots().map((snapshot) {
      return snapshot;
    });
  }

  Future<DocumentSnapshot> createRoom(BuildContext context) async {
    DocumentSnapshot<Map<String, dynamic>> game = await collection.get();
    String email = UserProvider.of(context).user.email;
    String sharedId = Uuid().v1().split("-").join().substring(0, 6);
    var result = await gameplayReference.add({
      "id_user": email,
      "id_game": gameId,
    });
    DocumentReference<Map<String, dynamic>> createdRoom =
        await roomReference.add(
      {
        "id_gameplay": result.id,
        "is_multiplayer": game.data()['is_multiplayer'],
        "participant": [email],
        'shared_id': sharedId
      },
    );
    await gameplayReference.doc(result.id).update({
      "id": result.id,
      "id_room": createdRoom.id,
    });
    await _updateId(createdRoom);
    DocumentSnapshot gameplay = await createdRoom.get();
    print(gameplay.data());
    return gameplay;
  }

  Future<void> _updateId(DocumentReference docRef) async {
    return await docRef.update({
      "id": docRef.id,
      "created_at": DateTime.now().toIso8601String(),
      "updated_at": DateTime.now().toIso8601String(),
    });
  }
}
