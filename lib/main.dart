import 'package:flutter/material.dart';
import 'package:islami_c13_monday/cache_helper/cache_helper.dart';
import 'package:islami_c13_monday/hadeth_details/hadeth_details.dart';
import 'package:islami_c13_monday/home/home.dart';
import 'package:islami_c13_monday/home/tabs/sebha_screen_tab.dart';
import 'package:islami_c13_monday/my_theme_data.dart';
import 'package:islami_c13_monday/onboading_screen.dart';
import 'package:islami_c13_monday/sura_details/sura_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: CacheHelper.getEligibility() == true
          ? HomeScreen.routeName
          : OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => const HadethDetailsScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
