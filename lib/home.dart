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

class _HomeState extends State<Home> {
  bool skullTurn = true;
  List<bool> visibilityPositions = List.generate(9, (index) => true);
  List<bool> placeSkull = List.generate(9, (index) => false);
  double imageHeight = 70;
  double imageWidth = 70;

  @override
  Widget build(BuildContext context) {
    double boardWidth = 250;
    double boardHeight = 300;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 253, 1),
      appBar: AppBar(title: Text("Tic Tac Toe")),
      body: Column(
        children: [
          Container(
            width: 250,
            height: 250,
            color: Colors.yellow,
            child: Stack(
              children: [
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Text("TIC"),
                //       Text("TAC"),
                //       Text("TOE"),
                //     ],
                //   ),
                // ),
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
              //   horizontalLine(topSpace: 50, width: 5, color: Colors.blue),
              //   horizontalLine(topSpace: 170, width: 5, color: Colors.blue),
              //   horizontalLine(topSpace: 275, width: 5, color: Colors.blue),
              //
              //   verticalLine(leftSpace: 35, width: 5, color: Colors.blue),
              //   verticalLine(leftSpace: 107, width: 5, color: Colors.blue),
              //   verticalLine(leftSpace: 180, width: 5, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Box({required index}){
    return GestureDetector(
      onTap: (){
        visibilityPositions[index] = true;
        if(skullTurn){
          placeSkull[index] = true;
        }
        skullTurn = !skullTurn;
        setState(() {});
      },
      child: visibilityPositions[index] ?
      placeSkull[index] ?
      Image.asset(ProjectPaths.skull, width: imageWidth, height: imageHeight) :
      Image.asset(ProjectPaths.bomb, width: imageWidth, height: imageHeight) :
      SizedBox(width: 70, height: 70, child: Image.asset(ProjectPaths.placeholder, width: imageWidth, height: imageHeight, fit: BoxFit.cover,),),
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
