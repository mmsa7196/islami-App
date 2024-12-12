import 'package:flutter/material.dart';
import 'package:islami_c13_monday/home/home.dart';
import 'package:islami_c13_monday/onBoading_screen.dart';
import 'package:islami_c13_monday/sura_details/sura_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoardingScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        SuraDetailsScreen.routeName: (context) =>  SuraDetailsScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
