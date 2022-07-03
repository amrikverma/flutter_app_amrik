import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/datamodel.dart';

class DBService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  Future<User> getUserProfileDocument(String userID) {
     var ref = _db.collection('user').doc(userID).get();
     return ref.then((doc) => User.fromMap(doc.data()!));
  }

  Stream<User> getUserProfileDocumentAsStream(String userID) {
    var ref = _db.collection('user').doc(userID).snapshots();
    return ref.map((doc) => User.fromMap(doc.data()!));
  }
}