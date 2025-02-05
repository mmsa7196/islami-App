import 'package:flutter/material.dart';

import 'quran_tab/radio_item.dart';


class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabBar(
              labelStyle: const TextStyle(
                  color: Color(0xff202020),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              unselectedLabelStyle: const TextStyle(
                  color: Colors.white, fontSize: 16),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffE2BE7F),
              ),
              dividerHeight: 0,
              tabs: const [
                Tab(
                  text: "Radio",
                ),
                Tab(
                  text: "Reciters",
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return const Radioitem();
                    },
                    itemCount: 4,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return const Radioitem();
                    },
                    itemCount: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}