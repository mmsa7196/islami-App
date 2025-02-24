import 'package:flutter/material.dart';

class Radioitem extends StatefulWidget {
  const Radioitem({super.key});

  @override
  State<Radioitem> createState() => _RadioitemState();
}

class _RadioitemState extends State<Radioitem> {
  bool isplay = true;

  bool isfav = false;

  bool isvol = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xffE2BE7F),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            isplay
                ? Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/Mosque-02.png",
                fit: BoxFit.fitWidth,
              ),
            )
                : Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/soundWave 1.png",
                fit: BoxFit.fitWidth,
                color: const Color(0xff20202033),
              ),
            ),
            Column(
              children: [
                const Text(
                  "Radio Ibrahim Al-Akdar",
                  style: TextStyle(
                    color: Color(0xff202020),
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        isfav = !isfav;
                        setState(() {});
                      },
                      icon: isfav
                          ? const Icon(Icons.favorite,
                          size: 30, color: Color(0xff202020))
                          : const Icon(Icons.favorite_border),
                      iconSize: 30,
                      color: const Color(0xff202020),
                    ),
                    IconButton(
                      onPressed: () {
                        isplay = !isplay;
                        setState(() {});
                      },
                      icon: isplay
                          ? const Icon(
                        Icons.play_arrow,
                        size: 30,
                        color: Color(0xff202020),
                      )
                          : const Icon(
                        Icons.pause,
                        size: 30,
                        color: Color(0xff202020),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        isvol = !isvol;
                        setState(() {});
                      },
                      icon: isvol
                          ? const Icon(
                        Icons.volume_up,
                        size: 30,
                        color: Color(0xff202020),
                      )
                          : const Icon(
                        Icons.volume_off,
                        size: 30,
                        color: Color(0xff202020),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}