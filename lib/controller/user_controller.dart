// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../data/user_data.dart';
// import '../utils/firebase_error.dart';

// class UserController extends GetxController {
//   bool isLoadingSignUp = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   User? firebaseUser;
//   bool isLoading = false;
//   // UserModel? userModel;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   void setLoading([bool? value]) {
//     isLoading = value ?? !isLoading;
//     update();
//   }

//   Future<void> signUp({
//     // required UserModel userData,
//     required String pass,
//     required Function() onSuccess,
//     required Function(String) onFail,
//   }) async {
//     isLoadingSignUp = true;
//     update();

//     await _auth
//         .createUserWithEmailAndPassword(email: userData.email!, password: pass)
//         .then((value) async {
//       firebaseUser = value.user;

//       await _saveUserData(userData);
//       await onSuccess();

//       isLoadingSignUp = false;
//       update();
//     }).catchError((e) {
//       debugPrint(e.toString());
//       onFail(getErrorString((e?.code as String?) ?? e.toString()));
//       isLoadingSignUp = false;
//       update();
//     });
//   }

//   Future<void> _saveUserData(UserModel userData) async {
//     userModel = userData;

//     await firestore
//         .collection("users")
//         .doc(firebaseUser!.uid)
//         .set(userModel!.toMap());
//   }
// }
