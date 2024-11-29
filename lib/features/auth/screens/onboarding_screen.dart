import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:final_project/features/auth/screens/signInScreen.dart';
import '../OnBording/navigation_button.dart';
import '../OnBording/onboarding_page_view._model.dart';
import '../OnBording/page_decoration.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPageIndex = 0;

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SignInScreen()));
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  Widget _buildTitle(String text, {String? highlight}) {
    if (highlight != null && text.contains(highlight)) {
      List<String> parts = text.split(highlight);
      return RichText(
        text: TextSpan(
          style: const TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.black),
          children: [
            TextSpan(text: parts[0]),
            TextSpan(
                text: highlight, style: const TextStyle(color: Color(0xff6759FF))),
            TextSpan(text: parts.length > 1 ? parts[1] : ''),
          ],
        ),
      );
    }
    return Text(
      text,
      style: const TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Stack(
            children: [
              IntroductionScreen(
                key: introKey,
                globalBackgroundColor: Colors.white,
                pages: [
                  OnboardingPageViewModel.buildPageViewModel(
                    title: "Comprehensive Home\n Services at Your Doorstep",
                    body:
                    "Whether it's cleaning, maintenance, or repairs, our Home Services Program brings skilled professionals directly to your home.",
                    imagePath: 'images/2.png',
                    highlight: "Your Doorstep",
                    decoration: OnboardingPageDecoration.pageDecoration,
                    buildImage: _buildImage,
                    buildTitle: _buildTitle,
                  ),
                  OnboardingPageViewModel.buildPageViewModel(
                    title: "Expert Solutions \n for Your Home",
                    body:
                    "From appliance repairs to deep cleaning, we cover all aspects of home care.",
                    imagePath: 'images/3.png',
                    highlight: "Expert Solutions",
                    decoration: OnboardingPageDecoration.pageDecoration,
                    buildImage: _buildImage,
                    buildTitle: _buildTitle,
                  ),
                  OnboardingPageViewModel.buildPageViewModel(
                    title: "Your Home,\n Our Priority",
                    body:
                    "Experience hassle-free home services with our trusted network of professionals.",
                    imagePath: 'images/4.png',
                    highlight: "Our Priority",
                    decoration: OnboardingPageDecoration.pageDecoration,
                    buildImage: _buildImage,
                    buildTitle: _buildTitle,
                  ),
                ],
                onDone: () => _onIntroEnd(context),
                showSkipButton: false,
                showNextButton: false,
                done: NavigationButton(
                  icon: Icons.arrow_forward,
                  onTap: () => _onIntroEnd(context),
                ),
                dotsDecorator: const DotsDecorator(
                  size: Size(10.0, 10.0),
                  color: Colors.grey,
                  activeSize: Size(22.0, 10.0),
                  activeColor: Color(0xff6759FF),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
                onChange: (index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
              ),
              Positioned(
                top: 40,
                right: 20,
                child: GestureDetector(
                  onTap: () => _onIntroEnd(context),
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Color(0xff6759FF), fontSize: 18),
                  ),
                ),
              ),
              if (currentPageIndex > 0)
                Positioned(
                  bottom: 25,
                  left: 44,
                  child: NavigationButton(
                    icon: Icons.arrow_back,
                    onTap: () {
                      if (introKey.currentState != null) {
                        introKey.currentState!.previous();
                      }
                    },
                    isBack: true,
                  ),
                ),
              if (currentPageIndex < 2)
                Positioned(
                  bottom: 25,
                  right: 44,
                  child: NavigationButton(
                    icon: Icons.arrow_forward,
                    onTap: () {
                      if (introKey.currentState != null) {
                        introKey.currentState!.next();
                      }
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}