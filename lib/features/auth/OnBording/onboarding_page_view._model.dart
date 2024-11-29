import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPageViewModel {
  static PageViewModel buildPageViewModel({
    required String title,
    required String body,
    required String imagePath,
    String? highlight,
    required PageDecoration decoration,
    required Widget Function(String assetName, [double width]) buildImage,
    required Widget Function(String text, {String? highlight}) buildTitle,
  }) {
    return PageViewModel(
      titleWidget: buildTitle(title, highlight: highlight),
      body: body,
      image: buildImage(imagePath),
      decoration: decoration,
    );
  }
}