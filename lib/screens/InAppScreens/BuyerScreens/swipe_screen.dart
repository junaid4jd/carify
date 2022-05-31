import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../widgets/components.dart';

class SwipeScreen extends StatefulWidget {
  SwipeScreen({Key? key}) : super(key: key);

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}
final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFFfb7c14));
final parStyle = const TextStyle(fontSize: 13, color: Colors.black);
final titles = const TextStyle(fontSize: 37,  fontWeight: FontWeight.bold, color: Colors.black);
final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);



class _SwipeScreenState extends State<SwipeScreen> {
  double value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Discover",
          style: TextStyle(
            color: Color(0xff424242),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SwipeCards(
        matchEngine: MatchEngine(
          swipeItems: [
            SwipeItem(),
            SwipeItem(),
            SwipeItem(),
            SwipeItem(),
            SwipeItem(),
          ],
        ),
        itemBuilder: (BuildContext context, int index) {
          return const SwipPage();
        },
        onStackFinished: () {},
        upSwipeAllowed: false,
        itemChanged: (SwipeItem item, int index) {},
      ),
    );
  }
}
