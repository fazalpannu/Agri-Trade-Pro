import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String uid;
  String cnic; // Add cinc
  String mobileNumber; // Add mobile number

  User({
    required this.name,
    required this.email,
    required this.uid,
    required this.profilePhoto,
    required this.cnic,
    required this.mobileNumber,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
        "cinc": cnic,
        "mobileNumber": mobileNumber,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      cnic: snapshot['cinc'],
      mobileNumber: snapshot['mobileNumber'],
    );
  }
}
