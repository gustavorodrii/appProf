// import 'package:cloud_firestore/cloud_firestore.dart';

// enum Power { DENIED, VIEWER, ADM }

// class UserModel {
//   UserModel();

//   String? kindOfSignUp;
//   String? email;
//   String? name;
//   String? phone;
//   Timestamp? registrationDate;
//   Timestamp? birthDate;

//   UserModel.fromJson(Map<String, dynamic> data) {
//     email = data['email'] as String?;

//     name = data['name'] as String?;
//     phone = data['phone'] as String?;
//     registrationDate = data['registrationDate'] as Timestamp?;
//     birthDate = data['birthDate'] as Timestamp?;
//     kindOfSignUp = data['kindOfSignUp'] as String?;
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "email": email,
//       "name": name,
//       "phone": phone,
//       "registrationDate": registrationDate,
//       "birthDate": birthDate,
//       "kindOfSignUp": kindOfSignUp,
//     };
//   }

//   @override
//   String toString() {
//     return 'UserModel{ email: $email,  name: $name, phone: $phone,  registrationDate: $registrationDate,  kindOfSignUp: $kindOfSignUp}';
//   }
// }
