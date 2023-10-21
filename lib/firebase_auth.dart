import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyFirebaseAuth{

  void signUp(String email, String pass) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
    }
    on FirebaseAuthException catch(e){
      print("firbase message : ${e.code.replaceAll('-', " ")}");
    }
    catch(e){
      print("errror -> $e");
    }
  }

  void login(String email, String pass) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
    }
    on FirebaseAuthException catch(e){
      print("firbase message : ${e.message}}");
    }
    catch(e){
      print("errror -> $e");
    }
  }

  void loginWithGoogle() async{
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleAccount!.authentication;
    var cred = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(cred);
  }

  void logout() async{
    await FirebaseAuth.instance.signOut();
  }

  bool checkUserLogedIn(){
    User? user=FirebaseAuth.instance.currentUser;
    if(user != null){
      return true;
    }
    else{
      return false;
    }
  }


}