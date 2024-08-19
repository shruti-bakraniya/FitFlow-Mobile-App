import 'package:fitflow/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalListviewWidget extends StatelessWidget {
  const VerticalListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 260,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: ColorConst.colorSilver,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 110,
                  decoration: const BoxDecoration(
                    color: ColorConst.colorPeach,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(19.0),
                      bottomLeft: Radius.circular(19.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(ImageConst.imageWorkout1),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 19.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sweat Starter",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorConst.colorDarkGrey,
                        ),
                      ),
                      Text(
                        "Full Body",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: ColorConst.colorSlateGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: ColorConst.colorSilver,
                            width: 1.0,
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5.0,
                        ),
                        child: Text(
                          "Lose Weight",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 8,
                            color: ColorConst.colorBlue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Difficulty : ",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: ColorConst.colorSlateGrey,
                                  )
                              ),
                              TextSpan(
                                  text: "Medium",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: ColorConst.colorLitePink,
                                  )
                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 19.0,
          ),
          Container(
            width: 260,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: ColorConst.colorSilver,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 110,
                  decoration: const BoxDecoration(
                    color: ColorConst.colorPeach,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(19.0),
                      bottomLeft: Radius.circular(19.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(ImageConst.imageWorkout2),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 19.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lunges",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorConst.colorDarkGrey,
                        ),
                      ),
                      Text(
                        "Lower Body",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: ColorConst.colorSlateGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: ColorConst.colorSilver,
                            width: 1.0,
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5.0,
                        ),
                        child: Text(
                          "Lose Weight",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 8,
                            color: ColorConst.colorBlue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Difficulty : ",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: ColorConst.colorSlateGrey,
                                  )
                              ),
                              TextSpan(
                                  text: "Medium",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: ColorConst.colorLitePink,
                                  )
                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 19.0,
          ),
          Container(
            width: 260,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: ColorConst.colorSilver,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 110,
                  decoration: const BoxDecoration(
                    color: ColorConst.colorPeach,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(19.0),
                      bottomLeft: Radius.circular(19.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(ImageConst.imageWorkout1),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 19.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sweat Starter",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorConst.colorDarkGrey,
                        ),
                      ),
                      Text(
                        "Full Body",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: ColorConst.colorSlateGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: ColorConst.colorSilver,
                            width: 1.0,
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5.0,
                        ),
                        child: Text(
                          "Lose Weight",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 8,
                            color: ColorConst.colorBlue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Difficulty : ",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: ColorConst.colorSlateGrey,
                                  )
                              ),
                              TextSpan(
                                  text: "Medium",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: ColorConst.colorLitePink,
                                  )
                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 19.0,
          ),
          Container(
            width: 260,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: ColorConst.colorSilver,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 110,
                  decoration: const BoxDecoration(
                    color: ColorConst.colorPeach,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(19.0),
                      bottomLeft: Radius.circular(19.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(ImageConst.imageWorkout2),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 19.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lunges",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorConst.colorDarkGrey,
                        ),
                      ),
                      Text(
                        "Lower Body",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: ColorConst.colorSlateGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: ColorConst.colorSilver,
                            width: 1.0,
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 5.0,
                        ),
                        child: Text(
                          "Lose Weight",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 8,
                            color: ColorConst.colorBlue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Difficulty : ",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: ColorConst.colorSlateGrey,
                                  )
                              ),
                              TextSpan(
                                  text: "Medium",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: ColorConst.colorLitePink,
                                  )
                              ),
                            ]
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
    );
  }
}
