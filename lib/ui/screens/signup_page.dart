import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/custom_textfield.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                height: size.height * 0.2,
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
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage: const AssetImage(
                                  'assets/images/structimg.png',
                                ),
                              ),
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
              const Text(
                'Sign Up',
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
                      hintText: 'Enter Email',
                      icon: Icons.alternate_email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Add email validation logic if needed
                        return null;
                      },
                    ),
                    CustomTextfield(
                      controller: _usernameController,
                      obscureText: false,
                      hintText: 'Enter Username',
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        // Add email validation logic if needed
                        return null;
                      },
                    ),
                    CustomTextfield(
                      controller: _passwordController,
                      obscureText: true,
                      hintText: 'Enter Password',
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        // Add email validation logic if needed
                        return null;
                      },
                    ),
                    CustomTextfield(
                      controller: _phoneController,
                      obscureText: true,
                      hintText: 'Enter PhoneNumber',
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your PhoneNumber';
                        }
                        // Add email validation logic if needed
                        return null;
                      },
                    ),
                    CustomTextfield(
                      controller: _cnicController,
                      obscureText: true,
                      hintText: 'Enter CNIC',
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your CNIC';
                        }
                        // Add email validation logic if needed
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    authController.registerUser(
                      _usernameController.text,
                      _emailController.text,
                      _passwordController.text,
                      authController.profilePhoto,
                      _phoneController.text,
                      _cnicController.text,
                    );
                    Get.offAll(const SignIn());
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
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
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
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child: const SignIn(),
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Have an Account? ',
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
