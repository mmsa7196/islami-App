import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraNameItem extends StatelessWidget {
  String nameAr;
  String nameEn;
  int index;
  int numOfVerses;

  SuraNameItem(
      {required this.nameEn,
      required this.nameAr,
      required this.index,
      required this.numOfVerses,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/sura_number.png"),
            Container(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "$index",
                style: GoogleFonts.elMessiri(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameEn,
                style: GoogleFonts.elMessiri(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "$numOfVerses Verses",
                style: GoogleFonts.elMessiri(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Text(
          nameAr,
          style: GoogleFonts.elMessiri(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}
