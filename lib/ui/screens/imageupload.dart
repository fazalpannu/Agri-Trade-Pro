import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class imageupload extends StatefulWidget {
  const imageupload({Key? key}) : super(key: key);

  @override
  State<imageupload> createState() => _imageuploadState();
}

class _imageuploadState extends State<imageupload> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _cropname = TextEditingController();
    TextEditingController _cropdescription = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          title: Text('Sell Crop'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Text('Crop Name'),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _cropname,
                        decoration: InputDecoration(
                          hintText: 'Enter Crop Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      TextFormField(
                        maxLines: 4,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter some text' : null,
                        controller: _cropdescription,
                        decoration: InputDecoration(
                          hintText: 'Enter Crop Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: Obx(() => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: uploadController.imageList.length,
                      itemBuilder: (context, index) {
                        return Image.file(
                            File(uploadController.imageList[index].path),
                            fit: BoxFit.cover);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                    )))),
            // Container(
            //   height: 200,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: Colors.grey,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Icon(
            //     Icons.camera_alt,
            //     color: Colors.white,
            //     size: 100,
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   'Upload Image',
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   'Upload your image to get the result',
            //   style: TextStyle(
            //     fontSize: 16,
            //     color: Colors.grey,
            //   ),
            // ),

            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  uploadController.sellerdetails(
                      _cropname.text, _cropdescription.text);
                  Get.snackbar('Success', 'Crop Added Successfully');
                  _cropname.clear();
                  _cropdescription.clear();
                }
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Upload ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
