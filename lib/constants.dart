import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/controller/auth_controller.dart';
import 'package:flutter_onboarding/controller/upload_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Constants {
  //Primary color
  static var primaryColor = const Color(0xff296e48);
  static var blackColor = Colors.black54;

  //Onboarding texts
  static var titleOne = "Buyer and Seller  ";
  static var descriptionOne =
      "Seller can sell their crops and buyer can buy crops from seller.";
  static var titleTwo = "Price Prediction";
  static var descriptionTwo =
      "We will predict the price of crops based on the previous data.";
  static var titleThree = "Disease Detection and Medicine Suggestions";
  static var descriptionThree =
      "We will detect the disease of crops and suggest the medicine for that disease.";
}

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
AuthController authController = Get.put(AuthController());
UploadController uploadController = Get.put(UploadController());
