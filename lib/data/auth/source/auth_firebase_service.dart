import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:ecommerce/data/auth/models/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set({
        'firstname': user.firstname,
        'lastname': user.lastname,
        'email': user.email,
        'gender': user.gender,
        'age': user.age,
      });
      return const Right('sign up was successfully');
    } on FirebaseAuthException catch (e) {
      String message = 'Error';
      if (e.code == 'weak-password') {
        return const Left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return const Left('The account already exists for that email.');
      } else {
        message = e.message!;
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();
      return Right(returnedData.docs);
    } catch (e) {
      return Left('please try again');
    }
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return const Right('sign in was successfully');
    } on FirebaseAuthException catch (e) {
      String message = 'Error';
      if (e.code == 'user-not-found') {
        return const Left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return const Left('Wrong pword provided for that user.');
      } else {
        message = e.message!;
      }
      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Password reset email sent');
    } on FirebaseAuthException catch (e) {
      String message = 'Error';
      if (e.code == 'user-not-found') {
        return const Left('No user found for that email.');
      } else {
        message = e.message!;
      }
      return Left(message);
    }
  }
  
  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
  
  @override
  Future<Either> getUser() async {
    try{
      var currentUser =  FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser!.uid)
          .get().then((value) => value.data());
      return Right(userData);    
  }catch(e){
      return Left('please try again');
    }
  }

}
