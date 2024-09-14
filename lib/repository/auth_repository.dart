import 'package:assignment/core/exceptions.dart';
import 'package:assignment/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login({required String email, required String password}) async {
    try {
      final userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCred.user == null) {
        throw CustomException(message: "User is Null");
      }
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message ?? "Something went wrong");
    } catch (e) {
      print(e);
      throw CustomException(message: "Something went wrong");
    }
  }

  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCred.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message ?? "Something went wrong");
    } catch (e) {
      print(e);
      throw CustomException(message: "Something went wrong");
    }
  }

  Future<void> updateUserData({required UserModel user}) async {
    try {
      await _firestore.collection("users").doc(user.uid).set(user.toJson());
    } catch (e) {
      throw CustomException(message: "Something went wrong");
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw CustomException(message: "Something went wrong");
    }
  }

  Stream<User?> get onAuthStateChange => _auth.authStateChanges();
}
