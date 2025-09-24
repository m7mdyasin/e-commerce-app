import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_market/core/services/data_service.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? uId,
  }) async {
    if (uId != null) {
      firestore.collection(path).doc(uId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String uId,
  }) async {
    var data = await firestore.collection(path).doc(uId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String uId,
  }) async {
    var data = await firestore.collection(path).doc(uId).get();
    return data.exists;
  }
}
