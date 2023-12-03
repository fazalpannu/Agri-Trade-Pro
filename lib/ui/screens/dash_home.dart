import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/components/card_custom.dart';
import 'package:flutter_onboarding/ui/components/circle_progress.dart';
import 'package:flutter_onboarding/ui/components/list_tile_custom.dart';
import 'package:flutter_onboarding/ui/screens/road_map.dart';
import 'package:flutter_onboarding/ui/screens/selectimage.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:flutter_onboarding/ui/themes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width / 2 - 20,
                        child: Column(
                          children: [
                            // CustomPaint(
                            //   foregroundPainter: CircleProgress(),
                            //   child: SizedBox(
                            //     width: 107,
                            //     height: 107,
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           "35",
                            //           style: textBold,
                            //         ),
                            //         Text(
                            //           "REACH",
                            //           style: textSemiBold,
                            //         ),
                            //         Row(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.center,
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.center,
                            //           children: [
                            //             Icon(
                            //               Icons.arrow_upward_outlined,
                            //               color: green,
                            //               size: 14,
                            //             ),
                            //             Text(
                            //               "8.1%",
                            //               style: textSemiBold,
                            //             ),
                            //           ],
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            Obx(
                              () => CircleAvatar(
                                radius: 64,
                                backgroundImage:
                                    NetworkImage(authController.photo.value),
                              ),
                            ),

                            Obx(() => Text(
                                  authController.name.value,
                                  style: textBold3,
                                )),
                            Obx(() => Text(
                                  authController.email.value,
                                  style: textBold2,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 6,
                  color: sparatorColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Key Features ',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.montserrat().copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: purple1,
                          ),
                        ),
                      ),
                      // RichText(
                      //   text: TextSpan(
                      //       text: "Keys Features ",
                      //       style: GoogleFonts.montserrat().copyWith(
                      //           fontWeight: FontWeight.w400,
                      //           fontSize: 18,
                      //           color: purple1),
                      //       children: const <TextSpan>[
                      //         TextSpan(
                      //             text: " ",
                      //             style: TextStyle(fontWeight: FontWeight.bold))
                      //       ]),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => const Road_map());
                            },
                            child: CardCustom(
                              width: size.width / 2 - 23,
                              height: 99.9,
                              mLeft: 0,
                              mRight: 3,
                              child: ListTileCustom(
                                bgColor: purpleLight,
                                pathIcon: "road-map-handout-svgrepo-com.svg",
                                title: "\n\nAGRI-ROAD MAP",
                                subTitle: "",
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const selectimage());
                            },
                            child: CardCustom(
                              width: size.width / 2 - 23,
                              height: 99.9,
                              mLeft: 3,
                              mRight: 0,
                              child: ListTileCustom(
                                bgColor: greenLight,
                                pathIcon: "wheat-grain-svgrepo-com.svg",
                                title: "\n\nCROP SELLING",
                                subTitle: "",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 99.9,
                            mLeft: 0,
                            mRight: 3,
                            child: ListTileCustom(
                              bgColor: yellowLight,
                              pathIcon: "analytics-analysis-svgrepo-com.svg",
                              title: "\n\nPRICE PREDICTION",
                              subTitle: "",
                            ),
                          ),
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 99.9,
                            mLeft: 3,
                            mRight: 0,
                            child: ListTileCustom(
                              bgColor: blueLight,
                              pathIcon: "medicine-svgrepo-com.svg",
                              title: "\n\nMEDICINE SUGGESTION",
                              subTitle: "",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Card(
                          //   elevation: 2.0,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(8.0),
                          //   ),
                          //   child: Container(
                          //     // Wrap the ListTile in a Container
                          //     width: double
                          //         .infinity, // Set the width to a specific value or use double.infinity
                          //     child: ListTile(
                          //       contentPadding: EdgeInsets.all(10.0),
                          //       tileColor: blueLight,
                          //       leading: SizedBox(
                          //         width: 40.0,
                          //         height: 40.0,
                          //         child: SvgPicture.asset(
                          //           "assets/icons/weather-svgrepo-com.svg",
                          //           color: Colors.white,
                          //         ),
                          //       ),
                          //       title: RichText(
                          //         text: TextSpan(
                          //           text: "\n\nMEDICINE SUGGESTION",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             color: Colors.white,
                          //           ),
                          //         ),
                          //       ),
                          //       subtitle: Text(""),
                          //     ),
                          //   ),
                          // ),

                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 99.9,
                            mLeft: 0,
                            mRight: 3,
                            child: ListTileCustom(
                              bgColor: yellowLight,
                              pathIcon: "weather-svgrepo-com.svg",
                              title: "\n\nWEATHER FORECASTE",
                              subTitle: "",
                            ),
                          ),
                          // Container(
                          //   width: size.width / 2 - 23,
                          //   child: Card(
                          //     elevation: 2.0,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(8.0),
                          //     ),
                          //     child: ListTile(
                          //       contentPadding: EdgeInsets.all(10.0),
                          //       tileColor: yellowLight,
                          //       leading: Image.asset(
                          //         "assets/path/to/your/weather-icon.png",
                          //         width: 40.0,
                          //         height: 40.0,
                          //       ),
                          //       title: Text(
                          //         "Weather Forecast",
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //       subtitle: Text("Forecast"),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      // CardCustom(
                      //     mLeft: 0,
                      //     mRight: 0,
                      //     width: size.width - 40,
                      //     height: 211,
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(20),
                      //           child: Row(
                      //             children: [
                      //               Container(
                      //                 width: 9.71,
                      //                 height: 9.71,
                      //                 decoration: BoxDecoration(
                      //                     shape: BoxShape.circle,
                      //                     color: purple2),
                      //               ),
                      //               SizedBox(
                      //                 width: 6,
                      //               ),
                      //               Text(
                      //                 "Visits",
                      //                 style: label,
                      //               ),
                      //               SizedBox(
                      //                 width: 12,
                      //               ),
                      //               Container(
                      //                 width: 9.71,
                      //                 height: 9.71,
                      //                 decoration: BoxDecoration(
                      //                     shape: BoxShape.circle, color: green),
                      //               ),
                      //               SizedBox(
                      //                 width: 6,
                      //               ),
                      //               Text(
                      //                 "Likes",
                      //                 style: label,
                      //               ),
                      //               SizedBox(
                      //                 width: 12,
                      //               ),
                      //               Container(
                      //                 width: 9.71,
                      //                 height: 9.71,
                      //                 decoration: BoxDecoration(
                      //                     shape: BoxShape.circle, color: red),
                      //               ),
                      //               SizedBox(
                      //                 width: 6,
                      //               ),
                      //               Text(
                      //                 "Conversions",
                      //                 style: label,
                      //               ),
                      //               SizedBox(
                      //                 width: 12,
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         Container(
                      //           width: size.width - 40,
                      //           height: 144.35,
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.only(
                      //                 bottomLeft: Radius.circular(15),
                      //                 bottomRight: Radius.circular(15),
                      //               ),
                      //               image: DecorationImage(
                      //                   image: AssetImage(
                      //                       "assets/images/graph.png"),
                      //                   fit: BoxFit.fill)),
                      //         )
                      //       ],
                      //     )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
