import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/scan_page.dart';
import 'package:flutter_onboarding/ui/screens/cart_page.dart';
import 'package:flutter_onboarding/ui/screens/dash_home.dart';
import 'package:flutter_onboarding/ui/screens/favorite_page.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/profile_page.dart';
import 'package:flutter_onboarding/ui/screens/road_map.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      // const HomePage()
      DashboardScreen(),
      FavoritePage(
        favoritedPlants: favorites,
      ),
      CartPage(
        addedToCartPlants: myCart,
      ),
      const ProfilePage(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.chat,
    Icons.help_center,
    Icons.settings,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Chat',
    'Help Center',
    'Settings',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: Get.width / 3),
            //   child: InkWell(
            //     onTap: () {
            //       Get.to(() => const Road_map());
            //     },
            //     child: Icon(
            //       Icons.integration_instructions_rounded,
            //       color: Constants.primaryColor,
            //       size: 40.0,
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(left: Get.width / 18),
              child: InkWell(
                  onTap: () {
                    try {
                      firebaseAuth.signOut().then((value) => Get.snackbar(
                          "Logout", "You have successfully logged out!"));
                      Get.to(SignIn());
                    } catch (e) {
                      Get.snackbar("Logout", "Error Logging out");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Constants.primaryColor,
                          size: 26.0,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const ScanPage(),
                  type: PageTransitionType.bottomToTop));
        },
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
            final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

            favorites = favoritedPlants;
            myCart = addedToCartPlants.toSet().toList();
          });
        },
      ),
    );
  }
}
