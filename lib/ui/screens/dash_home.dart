import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/components/card_custom.dart';
import 'package:flutter_onboarding/ui/components/circle_progress.dart';
import 'package:flutter_onboarding/ui/components/list_tile_custom.dart';
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
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width / 2 - 20,
                        child: Column(
                          children: [
                            CustomPaint(
                              foregroundPainter: CircleProgress(),
                              child: SizedBox(
                                width: 107,
                                height: 107,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "35",
                                      style: textBold,
                                    ),
                                    Text(
                                      "REACH",
                                      style: textSemiBold,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_upward_outlined,
                                          color: green,
                                          size: 14,
                                        ),
                                        Text(
                                          "8.1%",
                                          style: textSemiBold,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              authController.email.value,
                              style: textBold2,
                            ),
                            Text(
                              authController.name.value,
                              style: textBold3,
                            ),
                          ],
                        ),
                      ),
                      Obx(() => Container(
                            width: size.width / 2 - 20,
                            height: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        authController.photo.value))),
                          ))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 6,
                  color: sparatorColor,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Key metrics",
                            style: GoogleFonts.montserrat().copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: purple1),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: " this month",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 0,
                            mRight: 3,
                            child: ListTileCustom(
                              bgColor: purpleLight,
                              pathIcon: "line.svg",
                              title: "VISITS",
                              subTitle: "24",
                            ),
                          ),
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 3,
                            mRight: 0,
                            child: ListTileCustom(
                              bgColor: greenLight,
                              pathIcon: "thumb_up.svg",
                              title: "LIKES",
                              subTitle: "04",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 0,
                            mRight: 3,
                            child: ListTileCustom(
                              bgColor: yellowLight,
                              pathIcon: "starts.svg",
                              title: "FAVORITES",
                              subTitle: "55",
                            ),
                          ),
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 3,
                            mRight: 0,
                            child: ListTileCustom(
                              bgColor: blueLight,
                              pathIcon: "eyes.svg",
                              title: "VIEWS",
                              subTitle: "36",
                            ),
                          ),
                        ],
                      ),
                      CardCustom(
                          mLeft: 0,
                          mRight: 0,
                          width: size.width - 40,
                          height: 211,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 9.71,
                                      height: 9.71,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: purple2),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "Visits",
                                      style: label,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      width: 9.71,
                                      height: 9.71,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle, color: green),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "Likes",
                                      style: label,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      width: 9.71,
                                      height: 9.71,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle, color: red),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "Conversions",
                                      style: label,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width - 40,
                                height: 144.35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/graph.png"),
                                        fit: BoxFit.fill)),
                              )
                            ],
                          )),
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
