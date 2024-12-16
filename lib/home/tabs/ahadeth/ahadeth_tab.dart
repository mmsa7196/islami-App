import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c13_monday/hadeth_details/hadeth_details.dart';
import 'package:islami_c13_monday/models/hadeth_model.dart';
import 'package:islami_c13_monday/my_theme_data.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(height: double.infinity, autoPlay: false),
            items: allAhadeth.map((hadeth) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, HadethDetailsScreen.routeName,
                          arguments: hadeth);
                    },
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          "assets/images/hadeth_bg.png",
                          fit: BoxFit.fill,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Text(hadeth.title,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: MyThemeData.blackColor)),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(hadeth.content.first,
                                    textAlign: TextAlign.center,
                                    maxLines: 13,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: MyThemeData.blackColor)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 18,
        )
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then(
      (file) {
        List<String> ahadeth = file.split("#");

        for (String data in ahadeth) {
          List<String> lines = data.trim().split("\n");
          String title = lines[0];
          lines.removeAt(0);
          print(title);
          List<String> content = lines;
          HadethModel hadethModel = HadethModel(title, content);
          allAhadeth.add(hadethModel);
        }
        setState(() {});
      },
    ).catchError((error) {
      print("Error Details : $error");
    });
  }
}
