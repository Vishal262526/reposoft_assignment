import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phoneNumber;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;

    return UserModel(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      phoneNumber: data['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phone_number": phoneNumber,
    };
  }
}
