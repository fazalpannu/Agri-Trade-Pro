import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/imageupload.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class selectimage extends StatelessWidget {
  const selectimage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                uploadController.selectImage().then((value) {});
              },
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Select Crops',
              style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            Text(
              'for selling',
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
