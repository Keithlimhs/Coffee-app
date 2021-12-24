import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_coffee_app/models/coffee.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference coffees = FirebaseFirestore.instance.collection('coffees');

  Future updateUserData(String sugars, String name, int strength) async {
    return await coffees.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // coffee list from snapshot
  List<Coffee> _coffeeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Coffee(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  // get coffee stream
  Stream<List<Coffee>> get brews {
    return coffees.snapshots()
      .map(_coffeeListFromSnapshot);
  }
}