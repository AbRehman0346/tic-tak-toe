import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tic_tak_toe/constants.dart';
import 'package:tic_tak_toe/result.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // true --> Skull
  // false --> Bomb

  bool skullTurn = true;
  List<bool?> placeSkull = List.generate(9, (index) => null);
  List<bool> winPattern = List.generate(8, (index) => false);
  double imageHeight = 70;
  double imageWidth = 70;
  bool visibleControls = false;
  bool stopGame = false;
  bool showRestartButton = false;

  @override
  Widget build(BuildContext context) {
    double boardWidth = 250;
    double boardHeight = 300;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 253, 1),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              // Text TicTacToe
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Tic ",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.purple),
                  ),
                  Text("Tac ",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.yellow)),
                  Text(
                    "Toe",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.blueAccent),
                  ),
                ],
              ),

              // For Space
              const SizedBox(height: 100),

              // board of the game.
              SizedBox(
                width: 250,
                height: 250,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: boardWidth,
                        height: boardHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Box(index: 0),
                                Box(index: 1),
                                Box(index: 2),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Box(index: 3),
                                Box(index: 4),
                                Box(index: 5),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Box(index: 6),
                                Box(index: 7),
                                Box(index: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Board Lines
                    horizontalLine(
                        topSpace: 82.5, leftSpace: 0, lineStrach: boardWidth),
                    horizontalLine(
                        topSpace: 165, leftSpace: 0, lineStrach: boardWidth),
                    verticalLine(
                        topSpace: 0,
                        leftSpace: 82.5,
                        lineStreatch: boardHeight),
                    verticalLine(
                        topSpace: 0, leftSpace: 165, lineStreatch: boardHeight),

                    //   Winning Lines
                    horizontalLine(
                      visible: winPattern[0],
                      topSpace: 40,
                      leftSpace: 0,
                      width: 5,
                      lineStrach: boardWidth,
                      color: Colors.blue,
                    ),
                    horizontalLine(
                        visible: winPattern[1],
                        topSpace: 125,
                        leftSpace: 0,
                        width: 5,
                        lineStrach: boardWidth,
                        color: Colors.blue),
                    horizontalLine(
                        visible: winPattern[2],
                        topSpace: 208,
                        leftSpace: 0,
                        width: 5,
                        lineStrach: boardWidth,
                        color: Colors.blue),

                    verticalLine(
                        visible: winPattern[3],
                        leftSpace: 40,
                        topSpace: 0,
                        width: 5,
                        lineStreatch: boardHeight,
                        color: Colors.blue),
                    verticalLine(
                        visible: winPattern[4],
                        leftSpace: 123,
                        topSpace: 0,
                        width: 5,
                        lineStreatch: boardHeight,
                        color: Colors.blue),
                    verticalLine(
                        visible: winPattern[5],
                        leftSpace: 205,
                        topSpace: 0,
                        width: 5,
                        lineStreatch: boardHeight,
                        color: Colors.blue),

                    // Positioned(
                    //   left: 50,
                    //   top: 0,
                    //   child: Container(
                    //     width: 5,
                    //     height: boardHeight,
                    //     color: Colors.blue,
                    //   ),)
                  ],
                ),
              ),

              // for space
              const SizedBox(height: 20),

              // It's Draw information
              Visibility(
                visible: visibleControls,
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(-5, 5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                          ),
                        ]),
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Center(
                        child: Text(
                      "It's a Draw",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Restart button
              Visibility(
                visible: visibleControls || showRestartButton,
                child: GestureDetector(
                  onTap: restart,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(-5, 5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                          ),
                        ]),
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Center(
                        child: Text(
                      "Restart",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Box({required index}) {
    return GestureDetector(
        onTap: () {
          if(!stopGame){
            if (placeSkull[index] == null) {
              setState(() {
                placeSkull[index] = skullTurn;
                skullTurn = !skullTurn;
              });
            }
            gameOver();
          }
        },
        child: placeSkull[index] != null
            ? placeSkull[index] == true
                ?
                //     Skull Container
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(ProjectPaths.skull,
                        width: imageWidth, height: imageHeight))
                :
                //     Bomb Container
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(ProjectPaths.bomb,
                        width: imageWidth, height: imageHeight))
            :
            //     Empty Box Container
            SizedBox(
                width: 70,
                height: 70,
                child: Image.asset(
                  ProjectPaths.placeholder,
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ));
  }

  Widget horizontalLine(
      {required double leftSpace,
      required double topSpace,
      double width = 2,
      Color color = Colors.black,
      double lineStrach = 200,
      bool visible = true}) {
    return Visibility(
      visible: visible,
      child: Positioned(
        left: leftSpace,
        top: topSpace,
        child: Container(
          width: lineStrach,
          height: width,
          color: color,
        ),
      ),
    );
  }

  Widget verticalLine(
      {required double topSpace,
      required double leftSpace,
      double width = 2,
      Color color = Colors.black,
      double lineStreatch = 200,
      bool visible = true}) {
    return Visibility(
      visible: visible,
      child: Positioned(
        left: leftSpace,
        top: topSpace,
        child: Container(
          width: width,
          height: lineStreatch,
          color: color,
        ),
      ),
    );
  }

  void restart(){
      setState(() {
        placeSkull = List.generate(9, (index) => null);
        winPattern = List.generate(8, (index) => false);
        skullTurn = true;
        visibleControls = false;
        stopGame = false;
        showRestartButton = false;
      });
  }

  void gameOver() {
    void navigateToResultScreen(bool isSkullWinner) {
      stopGame = true;
      Future.delayed(
        const Duration(seconds: 1),
        () {
          setState(() {
            showRestartButton = true;
          });
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>ResultScreen(isSkullWinner: isSkullWinner)), (route) => false);
          Navigator.push(context, MaterialPageRoute(builder: (_)=>ResultScreen(isSkullWinner: isSkullWinner)));
        }
      );
    }

    if (((placeSkull[0] != null)) &&
        (placeSkull[0] == placeSkull[1]) &&
        (placeSkull[0] == placeSkull[2])) {
      log("run 1st condition");
      winPattern[0] = true;
      if (placeSkull[0]!) {
        navigateToResultScreen(true);
      } else {
        navigateToResultScreen(false);
      }
    } else if (((placeSkull[3] != null)) &&
        (placeSkull[3] == placeSkull[4]) &&
        (placeSkull[3] == placeSkull[5])) {
      log("run 2nd condition");
      winPattern[1] = true;
      if (placeSkull[3]!) {
        navigateToResultScreen(true);
      } else {
        navigateToResultScreen(false);
      }
    } else if (((placeSkull[6] != null)) &&
        (placeSkull[6] == placeSkull[7]) &&
        (placeSkull[6] == placeSkull[8])) {
      log("run 3rd condition");
      winPattern[2] = true;
      if (placeSkull[6]!) {
        navigateToResultScreen(true);
      } else {
        navigateToResultScreen(false);
      }
    } else if (((placeSkull[0] != null)) &&
        (placeSkull[0] == placeSkull[3]) &&
        (placeSkull[0] == placeSkull[6])) {
      log("run 4th condition");
      winPattern[3] = true;
      if (placeSkull[0]!) {
        navigateToResultScreen(true);
      } else {
        navigateToResultScreen(false);
      }
    } else if (((placeSkull[1] != null)) &&
        (placeSkull[1] == placeSkull[4]) &&
        (placeSkull[1] == placeSkull[7])) {
      log("run 5th condition");
      winPattern[4] = true;
      if (placeSkull[1]!) {
        navigateToResultScreen(true);
      } else {
        navigateToResultScreen(false);
      }
    } else if (((placeSkull[2] != null)) &&
        (placeSkull[2] == placeSkull[5]) &&
        (placeSkull[2] == placeSkull[8])) {
      log("run 6th condition");
      winPattern[5] = true;
      if (placeSkull[2]!) {
        navigateToResultScreen(true);
      } else {
        navigateToResultScreen(false);
      }
    } else if ((placeSkull[0] != null) &&
        (placeSkull[0] == placeSkull[4]) &&
        (placeSkull[0] == placeSkull[8])) {
      log("run 7th condition");
      winPattern[6] = true; //no diagonal line present.
      if (placeSkull[0]!) {
        navigateToResultScreen(true);
      } else {
        navigateToResultScreen(false);
      }
    } else if (((placeSkull[2] != null)) &&
        (placeSkull[2] == placeSkull[4]) &&
        (placeSkull[2] == placeSkull[6])) {
      log("run 8th condition");
      winPattern[7] = true; //no diagonal line present.
      if (placeSkull[2]!) {
        navigateToResultScreen(true);
      } else {
        navigateToResultScreen(false);
      }
    }

    int countPlaces = 0;
    for (bool? value in placeSkull) {
      if (value != null) {
        countPlaces++;
      }
    }

    if (countPlaces == 9) {
      setState(() {
        visibleControls = true;
      });
    }
  }
}
