import 'package:fitflow/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetHeading extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;

  const WidgetHeading({
    super.key,
    required this.title,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 18.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: ColorConst.colorDarkGrey,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "View All",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorConst.colorDarkGrey,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                SvgPicture.asset(
                  IconConst.circularBackArrowIcon,
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
