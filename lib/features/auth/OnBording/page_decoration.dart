import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';

class OnboardingPageDecoration {
  static const PageDecoration pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(
        fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.black),
    bodyTextStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
    bodyPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    imagePadding: EdgeInsets.only(top: 50.0, bottom: 0),
    imageAlignment: Alignment.center,
    pageColor: Colors.white,
  );
}