import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c13_monday/home/tabs/quran_tab/sura_name_horizontal_item.dart';
import 'package:islami_c13_monday/home/tabs/quran_tab/sura_name_item.dart';
import 'package:islami_c13_monday/models/sura_model.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/onboarding_header.png"),
          _searchItem(),
          _suraHorizontalList(),
          _suraVerticalList(),
        ],
      ),
    );
  }

  Widget _suraVerticalList() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Suras List",
            textAlign: TextAlign.start,
            style: GoogleFonts.elMessiri(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                indent: 40,
                endIndent: 40,
                thickness: 2,
              ),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return SuraNameItem(model: SuraModel.getSuraModel(index));
              },
              itemCount: SuraModel.listLength,
            ),
          )
        ],
      ),
    );
  }

  Widget _suraHorizontalList() {
    return Column(
      children: [
        Text(
          "Most Recently ",
          textAlign: TextAlign.start,
          style: GoogleFonts.elMessiri(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 150,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 12,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SuraNameHorizontalItem(
                model: SuraModel.getSuraModel(index),
              );
            },
            itemCount: SuraModel.listLength,
          ),
        ),
      ],
    );
  }

  Widget _searchItem() {
    return Column(
      children: [
        TextField(
          controller: searchController,
          cursorColor: const Color(0xFFE2BE7F),
          cursorWidth: 3,
          style: GoogleFonts.elMessiri(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            labelText: "Sura Name",
            fillColor: const Color(0xB3202020),
            filled: true,
            labelStyle: GoogleFonts.elMessiri(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            prefixIcon: Image.asset(
              "assets/images/quran.png",
              color: const Color(0xFFE2BE7F),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFFE2BE7F),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE2BE7F), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE2BE7F), width: 2),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
