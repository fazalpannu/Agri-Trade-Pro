class update_User {
  String name;

  String uid;
  String profilePhoto;
  String mobileNumber;

  update_User({
    required this.name,
    required this.uid,
    required this.profilePhoto,
    required this.mobileNumber,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'profilePhoto': profilePhoto,
        'mobileNumber': mobileNumber,
      };
}
