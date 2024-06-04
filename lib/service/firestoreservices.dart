import 'package:cloud_firestore/cloud_firestore.dart';

class firestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(
      {required String name,
      required String price,
      required String detail}) async {
    try {
      await _firestore
          .collection('product')
          .add({
        'name': name,
        'price': price,
        'detail': detail
          });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProduct() async {}

  Future<void> deleteProduct({
    required String id,
}) async {
    await _firestore.collection('product').doc(id).delete();
  }

  Future<void> updateProduct({
    required String id,
    required String name,
    required String price,
    required String detail,}) async {
    try{
    await _firestore.collection('product').doc(id).update({
      'name': name,
       'price': price,
      'detail': detail,
    });
  }catch(e){
        print(e);
    }
  }
}
