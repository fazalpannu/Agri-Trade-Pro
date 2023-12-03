import 'package:cloud_firestore/cloud_firestore.dart';

class SellerDetails {
  String useremail;
  String uid;
  String profilePhoto;
  String username;
  String userCnic;
  String userPhoneNumber;
  String cropName;
  String cropDescription;
  List<String> cropSellerImages;

  SellerDetails({
    required this.username,
    required this.userCnic,
    required this.userPhoneNumber,
    required this.cropName,
    required this.cropDescription,
    required this.cropSellerImages,
    required this.useremail,
    required this.uid,
    required this.profilePhoto,
  });

  Map<String, dynamic> toJson() {
    return {
      "useremail": useremail,
      "uid": uid,
      "profilePhoto": profilePhoto,
      "username": username,
      "userCnic": userCnic,
      "userPhoneNumber": userPhoneNumber,
      "cropName": cropName,
      "cropDescription": cropDescription,
      "cropSellerImages": cropSellerImages,
    };
  }

  static SellerDetails fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return SellerDetails(
      username: snapshot['username'],
      userCnic: snapshot['userCnic'],
      userPhoneNumber: snapshot['userPhoneNumber'],
      cropName: snapshot['cropName'],
      cropDescription: snapshot['cropDescription'],
      cropSellerImages: List<String>.from(snapshot['cropSellerImages']),
      useremail: snapshot['useremail'],
      uid: snapshot['uid'],
      profilePhoto: snapshot['profilePhoto'],
    );
  }
}
