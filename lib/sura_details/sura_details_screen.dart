import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c13_monday/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetails";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var suraModel = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(suraModel.index + 1);
    }
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF202020),
        iconTheme: const IconThemeData(color: Color(0xFFE2BE7F)),
        title: Text(
          suraModel.nameEn,
          style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: const Color(0xFFE2BE7F)),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/details_bg.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Text(
                    suraModel.nameAr,
                    style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: const Color(0xFFE2BE7F)),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE2BE7F)),
                            borderRadius: BorderRadius.circular(15)),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: verses[index],
                                  style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: const Color(0xFFE2BE7F),
                                  ),
                                ),
                                TextSpan(
                                  text: "(${index + 1})",
                                  style: GoogleFonts.elMessiri(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: const Color(0xFFE2BE7F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: verses.length,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String suraFile = await rootBundle.loadString("assets/files/$index.txt");
    List<String> lines = suraFile.split("\n");
    verses = lines;
    setState(() {});
  }
}
