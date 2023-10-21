import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/models/product.dart';
import 'package:firebase_project/models/user.dart' as app;

class MyFirestore{

  void addUserInfo(app.User user) async{ // abdo, 30, male
    await FirebaseFirestore.instance.collection('users').add(user.toMap());
  }

  void setUserInfo(app.User user) async{
    String id = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(id).set(user.toMap()); // create and update
  }

  void updateUser(app.User user) async{ // abdo , 31, male
    String id = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(id).update(user.toMap()); // update only
  }

  void deleteUser() async{
    String id = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(id).delete();
  }

  void getUserInfo() async{
    String id = FirebaseAuth.instance.currentUser!.uid;
    var doc = await FirebaseFirestore.instance.collection('users').doc(id).get();
    app.User MyInfo = app.User.fromMap(doc.data()!);
  }

  void getProducts() async{
    var snapshot = await FirebaseFirestore.instance.collection('products').get();
    List<Product> products = snapshot.docs.map((doc){
      Product newProduct = Product.fromMap(doc.data());
      newProduct.id = doc.id;
      return newProduct;
    }).toList();
  }

  void deleteProduct(Product product) async{
    await FirebaseFirestore.instance.collection('products').doc(product.id).delete();
  }
}