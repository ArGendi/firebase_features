import 'package:firebase_database/firebase_database.dart';

class RealTimeServices{
  void setData() async{
    await FirebaseDatabase.instance.ref().child('title').set("Home");
  }
}