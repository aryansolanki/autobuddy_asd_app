import 'package:flutter/material.dart';

import 'package:autobuddy_asd_app/text.dart';

const kPrimaryColor = Colors.white;
const kSecondaryColor = Colors.black87;

const kDefaultPadding = EdgeInsets.symmetric(horizontal: 30);

TextStyle headingText = TextStyle(
    color: kPrimaryColor,
    fontFamily: text2,
    fontSize: 53,
    fontWeight: FontWeight.w700);

TextStyle titleText = TextStyle(
    color: kPrimaryColor,
    fontFamily: text2,
    fontSize: 40,
    fontWeight: FontWeight.w700);

TextStyle subTitle = TextStyle(
    color: kSecondaryColor, fontSize: 18, fontWeight: FontWeight.w500);

TextStyle textButton = TextStyle(
  color: kPrimaryColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

TextStyle DOB_button = TextStyle(
  color: kPrimaryColor,
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

TextStyle graph_heading = TextStyle(
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.dashed,
    color: kSecondaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w500);
