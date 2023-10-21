import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
class MyFirebaseStorage{

  Future<String> getImage() async{
    String id = FirebaseAuth.instance.currentUser!.uid;
    return await FirebaseStorage.instance.ref().child('$id.jpg').getDownloadURL();
  }

  void uploadImage(File file, String imageName) async{
    String id = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseStorage.instance.ref().child('$id.jpg').putFile(file);
  }
}