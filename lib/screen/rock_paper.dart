//flutter import
import 'dart:math';

import 'package:flutter/material.dart';

class RockPaper extends StatefulWidget {
  const RockPaper({Key? key}) : super(key: key);

  @override
  State<RockPaper> createState() => _RockPaperState();
}

class _RockPaperState extends State<RockPaper> {
  int counter = 1;
  int index1 = Random().nextInt(3);
  int index2 = Random().nextInt(3);
  int score = 0;

  List<String> rockImages = [
    "asset/images/rock.png", //0
    "asset/images/paper.png", //1
    "asset/images/Scissors.png", //2
  ];

  List<String> evaluation = [];



  changeImages() {
    setState(() {
      counter++;
      index1 = Random().nextInt(3);
      index2 = Random().nextInt(3);
    });
    checkWhoWin(index1, index2);
  }

  checkWhoWin(int index1, int index2) {
    // I am a Rock
    if (index1 == 0) {
      if (index2 == 0) {
        setState(() {
          evaluation.add("asset/images/eq.png");
        });
        return;
      }
      if (index2 == 1) {
        setState(() {
          evaluation.add("asset/images/unlike.png");
        });
        return;
      }
      if (index2 == 2) {
        setState(() {
          evaluation.add("asset/images/like.png");
          score++;
        });
        return;
      }
    }

    // Iam Paper
    if (index1 == 1) {
      if (index2 == 0) {
        setState(() {
          evaluation.add("asset/images/like.png");
          score++;
        });
        return;
      }
      if (index2 == 1) {
        setState(() {
          evaluation.add("asset/images/eq.png");
        });
        return;
      }
      if (index2 == 2) {
        setState(() {
          evaluation.add("asset/images/unlike.png");
        });
        return;
      }
    }

    // Iam Scissors
    if (index1 == 2) {
      if (index2 == 0) {
        setState(() {
          evaluation.add("asset/images/unlike.png");
        });
        return;
      }
      if (index2 == 1) {
        setState(() {
          evaluation.add("asset/images/like.png");
          score++;
        });
        return;
      }
      if (index2 == 2) {
        setState(() {
          evaluation.add("asset/images/eq.png");
        });
        return;
      }
    }
  }
  restartGame(){
    setState(() {
      counter = 0;
    });
  }
  // Widget displayDialog(){
  //   showDialog(context: context, builder: (builder))
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Rock Paper Scissors",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body:
      counter < 13 ?  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //row contain on 12 image
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...evaluation
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: Image.asset(e, width: 24),
                      ),
                    )
                    .toList()
              ],
            ),
            //row contain on rock paper scissors game
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: changeImages,
                    child: Image.asset(rockImages[index1], width: 348, height: 348, fit: BoxFit.contain,),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "vs",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Image.asset(rockImages[index2]),
                ),
              ],
            ),
            // Padding contain a row, this row contain on two Text => you and system
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "You",
                    style: TextStyle(color: Colors.yellow, fontSize: 32),
                  ),
                  Text(
                    "System",
                    style: TextStyle(color: Colors.yellow, fontSize: 32),
                  )
                ],
              ),
            )
          ],
        ),
      ) : Center(child: Text("$score / 12", style: const TextStyle(color: Colors.white, fontSize: 60),),),
    );
  }
}
