import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/profile_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // authController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: Obx(() => CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(authController.photo.value),
                    )),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(.5),
                    width: 5.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .3,
                child: Row(
                  children: [
                    Obx(() {
                      return Text(
                        authController.name.value,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                    SizedBox(
                        height: 24,
                        child: Image.asset("assets/images/verified.png")),
                  ],
                ),
              ),
              Obx(() => Text(
                    authController.email.value,
                    style: TextStyle(
                      color: Constants.blackColor.withOpacity(.3),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      icon: Icons.person,
                      title: 'My Profile',
                      onpressed: () {},
                    ),
                    ProfileWidget(
                      icon: Icons.settings,
                      title: 'Settings',
                      onpressed: () {},
                    ),
                    ProfileWidget(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      onpressed: () {},
                    ),
                    ProfileWidget(
                      icon: Icons.chat,
                      title: 'FAQs',
                      onpressed: () {},
                    ),
                    ProfileWidget(
                      icon: Icons.share,
                      title: 'Share',
                      onpressed: () {},
                    ),
                    ProfileWidget(
                      icon: Icons.logout,
                      title: 'Log Out',
                      onpressed: () {
                        try {
                          firebaseAuth.signOut().then((value) => Get.snackbar(
                              "Logout", "You have successfully logged out!"));
                          Get.to(SignIn());
                        } catch (e) {
                          Get.snackbar("Logout", "Error Logging out");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
