import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tak_toe/home.dart';
import 'constants.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
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
          SizedBox(
            height: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(ProjectPaths.skull, width: 120,),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
color: Colors.white,
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(-5, 5),
                          ),
                        ],
                      ),
                      child: const Text("Skull \"X\"", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w900, fontSize: 20),),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(ProjectPaths.bomb, width: 120,),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(-5, 5),
                          ),
                        ],
                      ),
                      child: const Text("Bomb \"O\"", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w900, fontSize: 20),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Home()), (route) => false);
          }, child: const Text("Start Game"))
        ],
      ),
    );
  }
}
