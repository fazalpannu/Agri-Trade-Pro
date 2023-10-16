import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator; // Add this line

  CustomTextfield({
    Key? key,
    required this.icon,
    required this.obscureText,
    required this.hintText,
    required this.controller,
    required this.validator,
    // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          color: Constants.blackColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Constants.blackColor.withOpacity(.3),
          ),
          hintText: hintText,
        ),
        cursorColor: Constants.blackColor.withOpacity(.5),
        validator: validator);
  }
}
