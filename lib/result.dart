import 'package:flutter/material.dart';

import 'home.dart';

class ResultScreen extends StatelessWidget {
  final bool isSkullWinner;

  const ResultScreen({Key? key, required this.isSkullWinner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 253, 1),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/trophy.gif',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    isSkullWinner ? 'assets/skull.gif' : 'assets/bomb.gif',
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    children: [
                      // Black border text
                      Text(
                        isSkullWinner ? "Skull X Won" : "Bomb X Won",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.black,
                        ),
                      ),
                      // Yellow background text
                      Text(
                        isSkullWinner ? "Skull X Won" : "Bomb X Won",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFF4AB3E),
                        ),
                      ),
                    ],
                  )

                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Home()), (route) => false);
                },
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
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Center(
                    child: Text(
                      "Restart",
                      style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // GestureDetector(
              //   onTap: () {
              //     // Handle quit action, maybe exit the app or navigate to a different screen
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10),
              //       boxShadow: const [
              //         BoxShadow(
              //           color: Colors.black,
              //           offset: Offset(-5, 5),
              //           spreadRadius: 3,
              //           blurRadius: 10,
              //           blurStyle: BlurStyle.normal,
              //         ),
              //       ],
              //     ),
              //     width: MediaQuery.of(context).size.width * 0.6,
              //     padding: const EdgeInsets.symmetric(vertical: 15),
              //     child: const Center(
              //       child: Text(
              //         "Quit",
              //         style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w900),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
