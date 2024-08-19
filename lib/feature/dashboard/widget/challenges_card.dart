import 'package:fitflow/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengesCardWidget extends StatelessWidget {
  const ChallengesCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: const BoxDecoration(
        color: ColorConst.colorLiteMintGreen,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 17,
              top: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today’s Challenge!",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: ColorConst.colorDarkMintGreen,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorConst.colorDarkMintGreen,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  width: 85,
                  height: 18,
                  alignment: Alignment.center,
                  child: Text(
                    "Push Up 20x",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: ColorConst.colorWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                SizedBox(
                  width: 165.0,
                  child: LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: ColorConst.colorWhite,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      ColorConst.colorLitePink,
                    ),
                    minHeight: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "10/20 ",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: ColorConst.colorDarkGreyShade,
                        ),
                      ),
                      TextSpan(
                        text: "Complete",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: ColorConst.colorDarkGreyShade,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorConst.colorWhite,
                    minimumSize: const Size(100, 27),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 4.0,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconConst.playIcon,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Continue",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.colorBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            ImageConst.imageChallenges,
            height: 115,
          ),
        ],
      ),
    );
  }
}
