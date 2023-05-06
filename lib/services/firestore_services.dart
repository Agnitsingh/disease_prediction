import 'package:disease_symptoms/consts/consts.dart';
// Get Users Data
class FirestorServices {
  static getUser(uid) {
    return firestore.collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

}