import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/custom_textfield.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class ProfileChange extends StatefulWidget {
  const ProfileChange({Key? key}) : super(key: key);

  @override
  _ProfileChangeState createState() => _ProfileChangeState();
}

class _ProfileChangeState extends State<ProfileChange> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              Center(
                child: Stack(
                  children: [
                    Obx(
                      () => Container(
                        child: authController.imagepath.isNotEmpty
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: FileImage(
                                  File(authController.imagepath.toString()),
                                ),
                              )
                            : Obx(() => CircleAvatar(
                                  radius: 64,
                                  backgroundImage:
                                      NetworkImage(authController.photo.value),
                                )),
                      ),
                    ),
                    Positioned(
                      bottom: -7,
                      left: 90,
                      child: IconButton(
                        onPressed: () {
                          print('pick image');
                          authController.pickImage();
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Updated Profile',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: formKey, // Added the form key here
                child: Column(
                  children: <Widget>[
                    CustomTextfield(
                      controller: _emailController,
                      obscureText: false,
                      hintText: 'Enter Email to Change Password',
                      icon: Icons.alternate_email,
                      validator: (value) {
                        // if (value == null) {
                        //   return null;
                        // } else if (value!.isNotEmpty &&
                        //     !GetUtils.isEmail(value!)) {
                        //   return 'Please enter a valid email';
                        // }
                        // return null;
                        // Add email validation logic if needed
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      controller: _usernameController,
                      obscureText: false,
                      hintText: 'Enter Username',
                      icon: Icons.person,
                      validator: (value) {
                        if ((((value!.length < 9) && (value!.length > 0)) ||
                                (value.contains(' '))) ||
                            (value!.contains(RegExp(r'[0-9]')))) {
                          return 'Please enter a valid name length , not Numeric and not space  in name';
                        } else if (value!.length == 0) {
                          return null;
                        }

                        // } // Add email validation logic if needed
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      controller: _phoneController,
                      obscureText: false,
                      hintText: 'Enter PhoneNumber',
                      icon: Icons.mobile_friendly,
                      validator: (value) {
                        if ((value!.length > 0) &&
                                (value!.length < 11 || value!.length > 11) ||
                            value!.contains(RegExp(r'[a-zA-Z]')) ||
                            value.contains(' ')) {
                          return 'Please enter a valid PhoneNumber';
                        } else {
                          return null;
                        } // Add email validation logic if needed
                      },
                    ),
                    // CustomTextfield(
                    //   controller: _cnicController,
                    //   obscureText: false,
                    //   hintText: 'Enter CNIC e.g: 3505532716199',
                    //   icon: Icons.credit_card,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter your CNIC';
                    //     } else if (value.length < 13) {
                    //       return 'Please enter a valid CNIC';
                    //     } else if (value.contains(RegExp(r'[a-zA-Z]'))) {
                    //       return 'Please enter a valid CNIC';
                    //     }

                    //     // Add email validation logic if needed
                    //     return null;
                    //   },
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    authController.updateprofile(
                      _usernameController.text,
                      _emailController.text,
                      authController.profilePhoto,
                      _phoneController.text,
                    );
                  }
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 13,
                  ),
                  child: Center(
                    child: Obx(() => authController.loading.value == true
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Change Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   children: const [
              //     Expanded(child: Divider()),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 10),
              //       child: Text('OR'),
              //     ),
              //     Expanded(child: Divider()),
              //   ],
              // ),
              //  const SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   width: size.width,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Constants.primaryColor),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   // padding: const EdgeInsets.symmetric(
              //   //   horizontal: 10,
              //   //   vertical: 6,
              //   // ),
              //   // child: Row(
              //   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   //   children: <Widget>[
              //   //     SizedBox(
              //   //       height: 35,
              //   //       child: Image.asset('assets/images/phone.png'),
              //   //     ),
              //   //     Text(
              //   //       'Sign Up with Phone Number',
              //   //       style: TextStyle(
              //   //         color: Constants.blackColor,
              //   //         fontSize: 18.0,
              //   //       ),
              //   //     ),
              //   //   ],
              //   // ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushReplacement(
              //       context,
              //       PageTransition(
              //         child: const SignIn(),
              //         type: PageTransitionType.bottomToTop,
              //       ),
              //     );
              //   },
              //   child: Center(
              //     child: Text.rich(
              //       TextSpan(
              //         children: [
              //           TextSpan(
              //             text: 'Have an Account? ',
              //             style: TextStyle(
              //               color: Constants.blackColor,
              //             ),
              //           ),
              //           TextSpan(
              //             text: 'Login',
              //             style: TextStyle(
              //               color: Constants.primaryColor,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),//
            ],
          ),
        ),
      ),
    );
  }
}
