import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tak_toe/home.dart';
import 'package:tic_tak_toe/info_screen.dart';

import 'constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(
        const Duration(seconds: 3),
            ()=>
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_)=>const InfoScreen(),
                    ),
                        (_)=>false,
                )
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(ProjectPaths.skull, width: 100,),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(ProjectPaths.bomb, width: 100,),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Text TicTacToe
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Tic ", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.purple),),
              Text("Tac ", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.yellow)),
              Text("Toe", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.blueAccent),),
            ],
          ),
        ],
      ),
    );
  }
}
