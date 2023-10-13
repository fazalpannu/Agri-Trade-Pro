import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onpressed;
  ProfileWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Constants.blackColor.withOpacity(.5),
                size: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: onpressed,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Constants.blackColor.withOpacity(.4),
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}
