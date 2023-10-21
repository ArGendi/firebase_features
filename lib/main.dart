import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/firebase_options.dart';
import 'package:firebase_project/firebase_realtime.dart';
import 'package:firebase_project/firebase_storage.dart';
import 'package:firebase_project/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){
                MyFirebaseAuth myFirebaseAuth = MyFirebaseAuth();
                myFirebaseAuth.signUp("abdo@gmail.com", "12345678");
              },
              child: Text('sign up'),
            ),
            TextButton(
              onPressed: (){
                MyFirebaseAuth myFirebaseAuth = MyFirebaseAuth();
                myFirebaseAuth.login("abdo1@gmail.com", "");
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: (){
                MyFirebaseAuth myFirebaseAuth = MyFirebaseAuth();
                myFirebaseAuth.loginWithGoogle();
              },
              child: Text('with Google'),
            ),
            TextButton(
              onPressed: () async{
                MyFirebaseStorage myFirebaseStorage = MyFirebaseStorage();
                String image = await myFirebaseStorage.getImage();
                setState((){
                  url = image;
                });
              },
              child: Text('get Image'),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.grey,
              child: url != null? Image.network(url!) : null,
            ),
            IconButton(
              onPressed: () async{
                ImagePicker picker = ImagePicker();
                XFile? xfile = await picker.pickImage(source: ImageSource.camera);
                if(xfile != null){
                  File file = File(xfile.path);
                  MyFirebaseStorage fs = MyFirebaseStorage();
                  fs.uploadImage(file, 'profile picture');
                }
              },
              icon: Icon(Icons.camera),
            ),
            TextButton(
              onPressed: () async{
                RealTimeServices realTimeServices = RealTimeServices();
                realTimeServices.setData();
              },
              child: Text('set Real time DB'),
            ),
          ],
        ),
      ),
    );
  }
}
