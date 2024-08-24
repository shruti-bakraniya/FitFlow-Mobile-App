import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitflow/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AssessmentEntryPage extends StatefulWidget {
  const AssessmentEntryPage({super.key});

  @override
  State<AssessmentEntryPage> createState() => _AssessmentEntryPageState();
}

class _AssessmentEntryPageState extends State<AssessmentEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          colors: [
            ColorConst.colorOliveGreen,
            ColorConst.colorDarkMintGreenShade,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 48,
                ),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('assessment').snapshots(),
                  builder: (context, snapshots) {
                    if(snapshots.connectionState == ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshots.hasError) {
                      print(snapshots.error);
                      return Center(child: Text('Error: ${snapshots.error}'));
                    }

                    final loadAssessmentData = snapshots.data!.docs;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: SvgPicture.asset(
                                IconConst.backArrowIcon,
                              ),
                            ),
                            const SizedBox(
                              height: 33,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.39,
                              child: Text(
                                loadAssessmentData[1].data()['title'],
                                style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    color: ColorConst.colorNavyBlueShade,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    height: 1.3
                                ),
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(25.0),
                                color: ColorConst.colorWhite,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 2.0,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    IconConst.timerIcon,
                                    width: 11,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "4 min",
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      color: ColorConst.colorNavyBlueShade,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Image.network(
                          loadAssessmentData[1].data()['imageUrl'],
                          fit: BoxFit.cover,
                          width: 165,
                          height: 225,
                          alignment: Alignment.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: ColorConst.colorWhite,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26.0),
                    topRight: Radius.circular(26.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 19.0,
                    vertical: 24.0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 9.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "What do you get ?",
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: ColorConst.colorNavyBlueShade,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 11.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorConst.colorLiteSilver,
                                    radius: 33,
                                    child: CircleAvatar(
                                      backgroundColor: ColorConst.colorWhite,
                                      radius: 31.5,
                                      child: SvgPicture.asset(
                                        ImageConst.imageHeart,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      "Key Body Vitals",
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8,
                                        color: ColorConst.colorDarkGrey,
                                        height: 1.3,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorConst.colorLiteSilver,
                                    radius: 33,
                                    child: CircleAvatar(
                                      backgroundColor: ColorConst.colorWhite,
                                      radius: 31.5,
                                      child: SvgPicture.asset(
                                        ImageConst.imageBodyPosture,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      "Posture Analysis",
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8,
                                        color: ColorConst.colorDarkGrey,
                                        height: 1.3,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorConst.colorLiteSilver,
                                    radius: 33,
                                    child: CircleAvatar(
                                      backgroundColor: ColorConst.colorWhite,
                                      radius: 31.5,
                                      child: SvgPicture.asset(
                                        ImageConst.imageProfile,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      "Body Composition",
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8,
                                        color: ColorConst.colorDarkGrey,
                                        height: 1.3,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorConst.colorLiteSilver,
                                    radius: 33,
                                    child: CircleAvatar(
                                      backgroundColor: ColorConst.colorWhite,
                                      radius: 31.5,
                                      child: SvgPicture.asset(
                                        ImageConst.imageMessage,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      "Instant Reports",
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8,
                                        color: ColorConst.colorDarkGrey,
                                        height: 1.3,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 47.0,
                          left: 9.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "How we do it?",
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: ColorConst.colorNavyBlueShade,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConst.colorSkyBlueShade,
                          borderRadius: BorderRadius.circular(22.0),
                          border: Border.all(
                            color: ColorConst.colorWhiteShade,
                            width: 1.0,
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          top: 21.0,
                        ),
                        padding: const EdgeInsets.only(
                          top: 155,
                          left: 10.0,
                          right: 10.0,
                          bottom: 15.0,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorConst.colorDarkGreen,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    IconConst.safetyIcon,
                                    height: 15,
                                    width: 13,
                                  ),
                                  const SizedBox(
                                    width: 9.0,
                                  ),
                                  Text(
                                    "We do not store or share your personal data",
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: ColorConst.colorSlateGreyShade,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 14.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13.0,
                              ),
                              child: ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                children: [
                                  ListTile(
                                    leading: Text(
                                      "1.",
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: ColorConst.colorBlack,
                                      ),
                                    ),
                                    minVerticalPadding: 0.0,
                                    horizontalTitleGap: 5.0,
                                    minTileHeight: 20,
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    minLeadingWidth: 8,
                                    title: const Text(
                                      "Ensure that you are in a well-lit space",
                                    ),
                                    titleTextStyle: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.3,
                                      color: ColorConst.colorBlack,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text(
                                      "2.",
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: ColorConst.colorBlack,
                                      ),
                                    ),
                                    minVerticalPadding: 0.0,
                                    horizontalTitleGap: 5.0,
                                    minTileHeight: 20,
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    minLeadingWidth: 8,
                                    title: const Text(
                                      "Allow camera access and place your device against a stable object or wall",
                                    ),
                                    titleTextStyle: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.3,
                                      color: ColorConst.colorBlack,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text(
                                      "3.",
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: ColorConst.colorBlack,
                                      ),
                                    ),
                                    minVerticalPadding: 0.0,
                                    horizontalTitleGap: 5.0,
                                    minTileHeight: 20,
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    minLeadingWidth: 8,
                                    title: const Text(
                                      "Avoiding wearing baggy clothes",
                                    ),
                                    titleTextStyle: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.3,
                                      color: ColorConst.colorBlack,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text(
                                      "4.",
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: ColorConst.colorBlack,
                                      ),
                                    ),
                                    minVerticalPadding: 0.0,
                                    horizontalTitleGap: 5.0,
                                    minTileHeight: 20,
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    minLeadingWidth: 8,
                                    title: const Text(
                                      "Make sure you exercise as per the instruction provided by the trainer",
                                    ),
                                    titleTextStyle: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.3,
                                      color: ColorConst.colorBlack,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Text(
                                      "5.",
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: ColorConst.colorBlack,
                                      ),
                                    ),
                                    minVerticalPadding: 0.0,
                                    horizontalTitleGap: 5.0,
                                    minTileHeight: 20,
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    minLeadingWidth: 8,
                                    title: const Text(
                                      "Watch the short preview before each exercise",
                                    ),
                                    titleTextStyle: TextStyle(
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.3,
                                      color: ColorConst.colorBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 47.0,
                          left: 9.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Benefits",
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: ColorConst.colorNavyBlueShade,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConst.colorSkyBlueShade,
                          borderRadius: BorderRadius.circular(22.0),
                          border: Border.all(
                            color: ColorConst.colorWhiteShade,
                            width: 1.0,
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          top: 21.0,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11.0,
                            vertical: 5.0,
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  color: ColorConst.colorBlack,
                                  size: 5,
                                ),
                                minVerticalPadding: 8.0,
                                horizontalTitleGap: 5.0,
                                minTileHeight: 20,
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                minLeadingWidth: 8,
                                title: const Text(
                                  "Holistic Insight into Physical Health Across Multiple Key Areas",
                                ),
                                titleTextStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.3,
                                  color: ColorConst.colorBlack,
                                ),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  color: ColorConst.colorBlack,
                                  size: 5,
                                ),
                                minVerticalPadding: 8.0,
                                horizontalTitleGap: 5.0,
                                minTileHeight: 20,
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                minLeadingWidth: 8,
                                title: const Text(
                                  "Enables Early Interventions, Improving Preventive Care and Health Outcomes",
                                ),
                                titleTextStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.3,
                                  color: ColorConst.colorBlack,
                                ),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  color: ColorConst.colorBlack,
                                  size: 5,
                                ),
                                minVerticalPadding: 8.0,
                                horizontalTitleGap: 5.0,
                                minTileHeight: 20,
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                minLeadingWidth: 8,
                                title: const Text(
                                  "Tailored Lifestyle and Health Recommendations Based on Detailed Assessment Results",
                                ),
                                titleTextStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.3,
                                  color: ColorConst.colorBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () {  },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorConst.colorBlue,
                            minimumSize: const Size(100, 57),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                              vertical: 4.0,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.play_arrow_rounded,
                                color: ColorConst.colorWhiteBlueShade,
                                size: 45,
                              ),
                              Text(
                                "Start Assessment",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConst.colorWhiteBlueShade,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
