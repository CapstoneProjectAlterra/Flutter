import 'package:flutter/material.dart';

const textColor = Color(0xFF35364F);
const primaryColor = Color(0xFF06919D);
const secondColor = Color(0xFF6CC5CD);
const secondColorLow = Color(0XFFBDE8EC);
const tertiary = Color(0XFF06779D);
const buttonColorPrimary = Color(0XFFF0A258);
const buttonColorSecondary = Color(0XFFF58114);
const buttonColorLight = Color(0XFFF6E1CD);
const statusSuccess = Color(0XFF52C41A);
const statusDanger = Color(0XFFF5222D);
const statusWarning = Color(0XFFFFAD14);
const statusInfo = Color(0XFF1890FF);

const LinearGradient gradientVertical = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    secondColor,
    tertiary,
  ],
);

const LinearGradient gradientHorizontal = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [tertiary, secondColor],
);

const InputDecorationTheme inputDecorationTheme = InputDecorationTheme();

const IconThemeData iconTheme = IconThemeData(color: Colors.white, size: 28);

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: primaryColor);
        }
        return const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Colors.white);
      },
    ),
    side: MaterialStateProperty.resolveWith<BorderSide?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return const BorderSide(color: buttonColorSecondary);
        }
        return null;
      },
    ),
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) return buttonColorSecondary;
        return primaryColor;
      },
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) return buttonColorSecondary;
        return primaryColor;
      },
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);

TextTheme textTheme = TextTheme(
  headline1: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Colors.grey.shade900),
  headline2: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Colors.grey.shade900),
  headline3: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Colors.grey.shade900),
  headline4: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: primaryColor),
  headline5: const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: primaryColor),
  headline6: const TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: primaryColor),
  subtitle1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Colors.grey.shade800),
  subtitle2: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Colors.grey.shade800),
  bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
      color: Colors.grey.shade700),
  bodyText2: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
      color: Colors.grey.shade800),
  button: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      color: Colors.grey.shade900),
  caption: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: Colors.grey.shade800),
);

const defaultPadding = 16.0;
