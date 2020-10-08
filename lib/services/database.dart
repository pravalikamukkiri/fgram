import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference  userCollection = Firestore.instance.collection('Users');

  Future updateUserData(String name,String Bio,String uid) async{
    return await userCollection.document(uid).setData({
      'name' : name,
      'bio' : Bio,
      'uid':uid,
      'followers':0,
      'following':0,
    });
  }
}