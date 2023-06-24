import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF087F23);
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color greyColor = Color(0xFF949494);
const Color lightGreyColor = Color(0xFFE6E6E6);
const Color greyShade3 = Color(0xFFB7B7B7);
const Color greyShade2 = Color(0xFFD2D2D2);
const Color secondaryColor = Color(0xFF3F3D56);
const Color redColor = Color(0xFFFF0000);
const Color greyF0Color = Color(0xFFF0F0F0);
const Color yellowColor = Color(0xFFFFAC33);

const double fixPadding = 10.0;

const SizedBox heightSpace = SizedBox(height: fixPadding);

const SizedBox height5Space = SizedBox(height: 5.0);

const SizedBox widthSpace = SizedBox(width: fixPadding);

const SizedBox width5Space = SizedBox(width: 5.0);

SizedBox heightBox(double height) {
  return SizedBox(height: height);
}

SizedBox widthBox(double width) {
  return SizedBox(width: width);
}

List<BoxShadow> buttonShadow = [
  BoxShadow(
      color: primaryColor.withOpacity(0.2),
      blurRadius: 12,
      offset: const Offset(0, 6)),
  BoxShadow(
      color: primaryColor.withOpacity(0.2),
      blurRadius: 12,
      offset: const Offset(0, -6))
];

const TextStyle rasa24BoldPrimary = TextStyle(
    letterSpacing: 3,
    fontFamily: "Rasa",
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryColor);

const TextStyle appBarStyle = TextStyle(fontWeight: FontWeight.w800);

const TextStyle extrabold18White =
    TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: whiteColor);

const TextStyle semibold12Grey =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: greyColor);

const TextStyle semibold12White =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: whiteColor);

const TextStyle semibold15White =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: whiteColor);

const TextStyle semibold14Grey =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: greyColor);

const TextStyle semibold15Grey =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: greyColor);

const TextStyle semibold16Grey =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: greyColor);

const TextStyle semibold14Black =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: blackColor);

const TextStyle semibold15Black =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: blackColor);

const TextStyle semibold16Black =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor);

const TextStyle semibold17Black =
    TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: blackColor);

const TextStyle semibold18Black =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: blackColor);

const TextStyle bold12Grey =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: greyColor);

const TextStyle bold20Black =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: blackColor);

const TextStyle bold16Black =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: blackColor);

const TextStyle bold18White =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: whiteColor);

const TextStyle bold12Primary =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: primaryColor);

const TextStyle bold16Primary =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: primaryColor);

const TextStyle bold18Primary =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: primaryColor);

const TextStyle bold10White =
    TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: whiteColor);

const TextStyle bold12White =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: whiteColor);

const TextStyle bold13White =
    TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: whiteColor);

const TextStyle bold15White =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: whiteColor);

const TextStyle bold16White =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: whiteColor);

const TextStyle bold16Grey =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: greyColor);

const TextStyle bold16Red =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: redColor);

const TextStyle bold15Black =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: blackColor);

const TextStyle bold17Black =
    TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: blackColor);

const TextStyle bold18Black =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: blackColor);

const TextStyle bold14Primary =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor);

const TextStyle bold15Primary =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: primaryColor);

const TextStyle regular14Grey =
    TextStyle(fontSize: 14, color: greyColor, fontWeight: FontWeight.w400);

const TextStyle regular14White =
    TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w400);

const TextStyle regular15Grey =
    TextStyle(fontSize: 15, color: greyColor, fontWeight: FontWeight.w400);

const TextStyle regular12Grey =
    TextStyle(fontSize: 12, color: greyColor, fontWeight: FontWeight.w400);

const TextStyle regular16Black =
    TextStyle(fontSize: 16, color: blackColor, fontWeight: FontWeight.w400);
