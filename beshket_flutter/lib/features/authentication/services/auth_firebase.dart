import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseAuth {
  Future<String> signIn (String email, String password);
  Future<String> signUp (String email, String password);
  Future<void> signOut();
  Future<User?> getCurrentUser();
}

class Authentication implements FireBaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance ;
  
  @override
  Future<String> signIn(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null){
        return credential.user!.uid;
      }
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found' || e.code == 'wrong-password'){
        print('Email or password was not entered correctly');
      }
    }
    final user =  _firebaseAuth.currentUser;
    if ( user != null){
      return user.uid.toString();
    }
    return 'fail';
  }

  @override
  Future<String> signUp(String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null){
        return credential.user!.uid.toString();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password'){
        print('The password is too weak');
      } else if ( e.code == 'email-already-in-use'){
        print('The account with this email is already exists');
      }
    } catch(e){
      print(e);
    }

    return 'fail';
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<User?> getCurrentUser() async{
    return _firebaseAuth.currentUser;
  }
}
 