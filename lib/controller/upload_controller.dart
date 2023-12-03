import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/cropsellerdetails.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageList = <XFile>[].obs;
  RxInt loading = RxInt(0);
  Future<int> selectImage() async {
    try {
      final List<XFile> selectedImage = await imagePicker.pickMultiImage();
      if (selectedImage != null) {
        imageList.addAll(selectedImage);
        Get.snackbar(
            'Image Selected', 'You have successfully selected an image');
      }
    } catch (e) {
      Get.snackbar(
        'Error ',
        e.toString(),
      );
    }
    return 1;
  }

  Future<String> _uploadToStorage(File image, int le) async {
    Reference ref = firebaseStorage
        .ref()
        .child('agriPicsSelling')
        .child(firebaseAuth.currentUser!.uid + '$le');

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  sellerdetails(String cropname, String cropdescription) async {
    try {
      loading.value = 1;
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('agriUsers').doc(uid).get();
      // get id
      var allDocs = await firestore.collection('cropsellerdetails').get();
      int len = allDocs.docs.length;
      // String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      // String thumbnail = await _uploadImageToStorage("Video $len", videoPath);
      List<String> downloadUrls = [];
      int i = 0;
      for (var img in imageList) {
        String url = await _uploadToStorage(File(img.path), i);
        downloadUrls.add(url);
        i = i + 1;
        Get.snackbar('Image Uploaded', 'Your image has been uploaded');
      }

      print(downloadUrls);

      SellerDetails sellerDetails = SellerDetails(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        useremail: (userDoc.data()! as Map<String, dynamic>)['email'],
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
        userCnic: (userDoc.data()! as Map<String, dynamic>)['cinc'],
        userPhoneNumber:
            (userDoc.data()! as Map<String, dynamic>)['mobileNumber'],
        cropName: cropname,
        cropDescription: cropdescription,
        cropSellerImages: List<String>.from(downloadUrls),
      );

      // Video video = Video(
      //   username: (userDoc.data()! as Map<String, dynamic>)['name'],
      //   uid: uid,
      //   id: "Video $len",
      //   likes: [],
      //   commentCount: 0,
      //   shareCount: 0,
      //   songName: songName,
      //   caption: caption,
      //   videoUrl: videoUrl,
      //   profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
      //   thumbnail: thumbnail,
      // );

      await firestore
          .collection('cropsellerdetails')
          .doc('cropsellerdetails $len')
          .set(
            sellerDetails.toJson(),
          )
          .then((value) {
        Get.snackbar('Details Upload  Successfully! ', '');
        imageList.clear();
        loading.value = 0;
      });
      // Get.back();
    } catch (e) {
      Get.snackbar(
        'Error Uploading  ',
        e.toString(),
      );
    }
  }
}
