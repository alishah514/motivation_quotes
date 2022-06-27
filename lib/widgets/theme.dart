import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color lightGreyClr = Color.fromARGB(242, 231, 230, 235);
const Color iconClr = Color.fromARGB(144, 144, 144, 144);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = darkGreyClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = Colors.grey[850]!;

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: darkGreyClr,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
    primaryColor: white,
  );
}

TextStyle get headingTextStyle {
  return GoogleFonts.raleway(
      fontSize: 18,
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.w800);
}

TextStyle get appBarTextStyle {
  return GoogleFonts.raleway(
      fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600);
}

TextStyle get subHeadingTextStyle {
  return GoogleFonts.raleway(
    textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get catTextStyle {
  return GoogleFonts.raleway(
    textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get titleTextStle {
  return GoogleFonts.raleway(
    textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get subTitleTextStle {
  return GoogleFonts.raleway(
    textStyle: TextStyle(
        fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white),
  );
}

TextStyle get bodyTextStyle {
  return GoogleFonts.raleway(
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get listTileTextStyle {
  return GoogleFonts.raleway(
    textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get body2TextStyle {
  return GoogleFonts.raleway(
    textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}
