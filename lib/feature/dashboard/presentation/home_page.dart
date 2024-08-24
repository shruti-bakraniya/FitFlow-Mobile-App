import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitflow/constant/constants.dart';
import 'package:fitflow/feature/dashboard/widget/widgets.dart';
import 'package:fitflow/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(
          double.infinity,
          70,
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
          ),
          child: AppBar(
            title: Text(
              "Hello Jane",
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: ColorConst.colorBlue,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            surfaceTintColor: ColorConst.colorWhite,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                    IconConst.profileIcon
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: Column(
            children: [
              Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConst.colorLiteGrey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: const EdgeInsets.all(6.0),
                child: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: "My Assessments",
                    ),
                    Tab(
                      text: "My Appointments",
                    ),
                  ],
                  dividerHeight: 0.0,
                  labelColor: ColorConst.colorBlue,
                  labelStyle: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  unselectedLabelColor: ColorConst.colorGrey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: ColorConst.colorWhite,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              Container(
                height: 315,
                margin: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                decoration: const BoxDecoration(
                  color: ColorConst.colorLiteBlue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          StreamBuilder(
                            stream: FirebaseFirestore.instance.collection('assessment').orderBy('createdAt', descending: false).snapshots(),
                            builder: (context, snapshots) {
                              if (snapshots.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              if (snapshots.hasError) {
                                print(snapshots.error);
                                return Center(child: Text('Error: ${snapshots.error}'));
                              }
                              final loadAssessmentData = snapshots.data!.docs;
                              return ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 12,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: ColorConst.colorWhite,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(11.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: double.infinity,
                                          width: 133,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                ColorConst.colorYellowBrown,
                                                ColorConst.colorBrown,
                                              ],
                                            ),
                                            shape: BoxShape.rectangle,
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(11.0),
                                              bottomLeft: Radius.circular(11.0),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(loadAssessmentData[0].data()['imageUrl']),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 11.0,
                                            horizontal: 14.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 144,
                                                child: Text(
                                                  loadAssessmentData[0].data()['title'],
                                                  style: TextStyle(
                                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: ColorConst.colorNavyBlueShade,
                                                  ),
                                                  maxLines: 2,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 144,
                                                child: Text(
                                                  loadAssessmentData[0].data()['description'],
                                                  style: TextStyle(
                                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    color: ColorConst.colorBlackShade,
                                                  ),
                                                  maxLines: 3,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      IconConst.playIcon,
                                                      height: 22.5,
                                                      width: 22.5,
                                                    ),
                                                    const SizedBox(
                                                      width: 9.6,
                                                    ),
                                                    Text(
                                                      "Start",
                                                      style: TextStyle(
                                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 14,
                                                        color: ColorConst.colorBlue,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    height: 138,
                                    decoration: BoxDecoration(
                                      color: ColorConst.colorWhite,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(11.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: double.infinity,
                                          width: 133,
                                          decoration: BoxDecoration(
                                            gradient: const RadialGradient(
                                              center: Alignment(0.0, 0.4),
                                              radius: 0.6,
                                              colors: [
                                                ColorConst.colorOliveGreen,
                                                ColorConst.colorDarkMintGreenShade,
                                              ],
                                            ),
                                            shape: BoxShape.rectangle,
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(11.0),
                                              bottomLeft: Radius.circular(11.0),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(loadAssessmentData[1].data()['imageUrl']),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 11.0,
                                            horizontal: 14.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 144,
                                                child: Text(
                                                  loadAssessmentData[1].data()['title'],
                                                  style: TextStyle(
                                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: ColorConst.colorNavyBlueShade,
                                                  ),
                                                  maxLines: 2,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 144,
                                                child: Text(
                                                  loadAssessmentData[1].data()['description'],
                                                  style: TextStyle(
                                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    color: ColorConst.colorBlackShade,
                                                  ),
                                                  maxLines: 3,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(AppRoutes.assessmentEntryPage);
                                                },
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      IconConst.playIcon,
                                                      height: 22.5,
                                                      width: 22.5,
                                                    ),
                                                    const SizedBox(
                                                      width: 9.6,
                                                    ),
                                                    Text(
                                                      "Start",
                                                      style: TextStyle(
                                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 14,
                                                        color: ColorConst.colorBlue,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                ],
                              );
                            },
                          ),
                          GridView.count(
                            primary: false,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 17,
                            ),
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            crossAxisCount: 2,
                            childAspectRatio: 1.28,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConst.colorSkyBlue,
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: ColorConst.colorWhite,
                                        radius: 28,
                                        child: SvgPicture.asset(
                                          ImageConst.imageAppointment1,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 1.5,
                                      ),
                                      Text(
                                        "Cancer 2nd Opinion",
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: ColorConst.colorNavyBlueShade,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.assessmentEntryPage);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConst.colorViolet,
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: ColorConst.colorWhite,
                                        radius: 28,
                                        child: SvgPicture.asset(
                                          ImageConst.imageAppointment2,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 1.5,
                                      ),
                                      Text(
                                        "Physiotherapy Appointment",
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: ColorConst.colorNavyBlueShade,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConst.colorPeachShade,
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: ColorConst.colorWhite,
                                        radius: 28,
                                        child: SvgPicture.asset(
                                          ImageConst.imageAppointment3,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 1.5,
                                      ),
                                      Text(
                                        "Fitness Appointment",
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: ColorConst.colorNavyBlueShade,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 93,
                            height: 23,
                            child: ElevatedButton(
                              onPressed: () {  },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: ColorConst.colorNavyBlue,
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                              ),
                              child: Text(
                                "View all",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConst.colorWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const WidgetHeading(
                title: "Challenges",
              ),
              const ChallengesCardWidget(),
              const WidgetHeading(
                title: "Workout Routines",
                padding: const EdgeInsets.only(
                  top: 14.0,
                  bottom: 12.00,
                  right: 18.0,
                  left: 18.0,
                ),
              ),
              const VerticalListviewWidget(),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
