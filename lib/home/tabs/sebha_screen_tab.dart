import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaScreenTab extends StatefulWidget {
  const SebhaScreenTab({super.key});

  @override
  State<SebhaScreenTab> createState() => _SebhaScreenTabState();
}

class _SebhaScreenTabState extends State<SebhaScreenTab> {
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله اكبر",
    "استغفر الله",
  ];
  int counter = 0;
  double turns = 0;
  late String Azkar = azkar[0];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: GoogleFonts.elMessiri(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const Row(),
                  Image.asset(
                    "assets/images/Group 37.png",
                    height: MediaQuery.of(context).size.height * .17,
                  ),
                  Positioned.fill(
                    top: MediaQuery.of(context).size.height * .10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: [
                          AnimatedRotation(
                            duration: const Duration(milliseconds: 500),
                            turns: turns,
                            child: GestureDetector(
                              onTap: () {
                                _ubdateAzkar();
                              },
                              child: Image.asset(
                                "assets/images/SebhaBody 1.png",
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Row(),
                                Text(
                                  Azkar,
                                  style: GoogleFonts.elMessiri(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  counter.toString(),
                                  style: GoogleFonts.elMessiri(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _ubdateAzkar() {
    counter++;
    turns = turns + (pi / 33);
    if (counter == 34) {
      Azkar = azkar[(azkar.indexOf(Azkar) + 1) % 5];
      counter = 0;
    }
    setState(() {});
  }
}
