import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/user.dart';
import 'package:flutter_onboarding/models/user.dart';
import 'package:flutter_onboarding/models/user.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_onboarding/models/user.dart' as model;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxInt pageIdx = 0.obs;

  RxString name = ''.obs;
  RxString photo = ''.obs;
  RxString email = ''.obs;

  late Rx<File?> _pickedImage;
  RxString imagepath = ''.obs;
  // static AuthController instance = Get.find();
  File? get profilePhoto => _pickedImage.value;
  void pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        Get.snackbar('Profile Picture',
            'You have successfully selected your profile picture!');
      }
      _pickedImage = Rx<File?>(File(pickedImage!.path));
      imagepath.value = (pickedImage!.path).toString();
    } catch (e) {
      Get.snackbar(
        'Error ',
        e.toString(),
      );
    }
  }

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('agriPics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void loginUser(String email, String password, int mode) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar(' Login Successfully', '');
          if (mode == 0) {
            Get.to(HomePage());
          } else {
            Get.to(RootPage());
          }
        });
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }
  }

  void forgetpassword(String email) async {
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
          Get.snackbar('Send Mail for Reset Password ', '');
          Get.to(SignIn());
        });
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }
  }

  void registerUser(String username, String email, String password, File? image,
      String phonenumber, String cnic) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // save out user to our ath and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
          cnic: cnic,
          mobileNumber: phonenumber,
        );
        await firestore
            .collection('agriUsers')
            .doc(cred.user!.uid)
            .set(user.toJson())
            .then(
          (value) {
            Get.snackbar(
              ' Create Account',
              'Thank You!',
            );

            _pickedImage = Rx<File?>(null);
            imagepath.value = '';
          },
        );
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }

  void fetch() {
    String uid = firebaseAuth.currentUser!.uid;

    firestore.collection('agriUsers').doc(uid).get().then((value) {
      print(value.data());
      name.value = (value.data()! as Map<String, dynamic>)['name'];
      photo.value = (value.data()! as Map<String, dynamic>)['profilePhoto'];
      email.value = (value.data()! as Map<String, dynamic>)['email'];
    });
  }

  void splash(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    if (user != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RootPage(),
          ));
    } else {
      print('User is currently signed out!');
    }
  }
}
