import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_c13_monday/home/home.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "/";

  const OnBoardingScreen({super.key});

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = GoogleFonts.elMessiri(
      fontSize: 19.0,
      color: const Color(0xFFE2BE7F),
    );

    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFE2BE7F),
      ),
      bodyTextStyle: bodyStyle,
      imageFlex: 3,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: const Color(0xFF202020),
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFF202020),
      globalHeader: Image.asset("assets/images/onboarding_header.png"),
      dotsFlex: 2,
      dotsDecorator: const DotsDecorator(
          color: Color(0xFF707070),
          activeColor: Color(0xFFE2BE7F),
          spacing: EdgeInsets.all(5)),
      showNextButton: true,
      showBackButton: true,
      back: Text(
        "Back",
        style: GoogleFonts.elMessiri(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFE2BE7F)),
      ),
      next: Text(
        "Next",
        style: GoogleFonts.elMessiri(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFE2BE7F)),
      ),
      done: Text(
        "Finish",
        style: GoogleFonts.elMessiri(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFE2BE7F)),
      ),
      showDoneButton: true,
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "",
          image: _buildImage('onboarding1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage('onboarding2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage('onboarding3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage('onboarding4.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage('onboarding5.png'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
