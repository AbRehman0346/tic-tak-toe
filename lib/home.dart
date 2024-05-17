import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tic_tak_toe/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum GameOverResponse{
  draw,
  skullWin,
  bombWin,
  gameContinue,
}

class _HomeState extends State<Home> {
  // true --> Skull
  // false --> Bomb

  bool skullTurn = true;
  List<bool?> placeSkull = List.generate(9, (index) => null);
  double imageHeight = 70;
  double imageWidth = 70;
  bool visibleControls = false;

  @override
  Widget build(BuildContext context) {
    double boardWidth = 250;
    double boardHeight = 300;

    // temperiory switches
    // visibleControls = true;



    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 253, 1),
      // appBar: AppBar(title: Text("Tic Tac Toe")),
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
                  Text("Tic ", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.purple),),
                  Text("Tac ", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.yellow)),
                  Text("Toe", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.blueAccent),),
                ],
              ),

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
                                // Image.asset(ProjectPaths.skull, width: imageWidth, height: imageHeight),
                                // Image.asset(ProjectPaths.skull, width: imageWidth, height: imageHeight),
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
                    horizontalLine(topSpace: 82.5, leftSpace: 0,  boardWidth: boardWidth),
                    horizontalLine(topSpace: 165, leftSpace: 0, boardWidth: boardWidth),
                    verticalLine(topSpace: 0, leftSpace: 82.5, boardHeight: boardHeight),
                    verticalLine(topSpace: 0, leftSpace: 165, boardHeight: boardHeight),

                  //   Winning Lines
                    horizontalLine(topSpace: 50, leftSpace: 0, width: 5, color: Colors.blue, ),
                    horizontalLine(topSpace: 170, leftSpace: 0, width: 5, color: Colors.blue),
                    horizontalLine(topSpace: 275, leftSpace: 0, width: 5, color: Colors.blue),

                    verticalLine(leftSpace: 35, topSpace: 0, width: 5, color: Colors.blue),
                    verticalLine(leftSpace: 107, topSpace: 0, width: 5, color: Colors.blue),
                    verticalLine(leftSpace: 180, topSpace: 0, width: 5, color: Colors.blue),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // It's Draw information
              Visibility(
                visible: visibleControls,
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(-5, 5),
                            spreadRadius: 3,
                            blurRadius: 10,
                          blurStyle: BlurStyle.normal,
                        ),
                      ]
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Center(child: Text("It's a Draw", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Restart button
              Visibility(
                visible: visibleControls,
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(-5, 5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                          ),
                        ]
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Center(child: Text("Restart", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w900),)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void gameOver(){
  //
  // }

  Widget Box({required index}){
    return GestureDetector(
      onTap: (){
        if(placeSkull[index] == null){
          setState(() {
            placeSkull[index] = skullTurn;
            skullTurn = !skullTurn;
          });
        }
      },
      child: placeSkull[index] != null ?
      placeSkull[index] == true ?
      //     Skull Container
      Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(ProjectPaths.skull, width: imageWidth, height: imageHeight)) :
      //     Bomb Container
      Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10),

          ),
          child: Image.asset(ProjectPaths.bomb, width: imageWidth, height: imageHeight)) :
      //     Empty Box Container
      SizedBox(width: 70, height: 70, child: Image.asset(ProjectPaths.placeholder, width: imageWidth, height: imageHeight, fit: BoxFit.cover,),)
    );
  }

  Widget horizontalLine({required double leftSpace, required double topSpace, double width = 2, Color color=Colors.black, double boardWidth=200}) {
    return Positioned(
      left: leftSpace,
        top: topSpace,
        child: Container(
          width: boardWidth,
          height: width,
          color: color,
        ),);
  }

  Widget verticalLine({required double topSpace, required double leftSpace, double width = 2, Color color=Colors.black, double boardHeight=200}) {
    return Positioned(
        left: leftSpace,
        top: topSpace,
        child: Container(
          width: width,
          height: boardHeight,
          color: color,
        ),);
  }
}
