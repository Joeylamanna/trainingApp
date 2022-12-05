import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0), //backround to black
        body: Stack(
          children: <Widget>[
            //Light Blue TOP BOX
            Positioned(
              top: 0,
              height: height * 0.35,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  //top: const Radius.circular(40),
                  bottom: Radius.circular(40),
                ),
                child: Container(
                  color: Color.fromARGB(255, 1, 217, 255),
                ),
              ),
            ),

            //WorkoutBox
            Positioned(
              top: 350,
              height: height * .2,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10, left: 32, right: 32),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 1, 217, 255),
                      Color.fromARGB(255, 0, 0, 0),
                    ],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      width: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0, left: 16),
                      child: Text(
                        "Monday",
                        style: TextStyle(
                            color: Color.fromARGB(179, 255, 255, 255),
                            fontSize: 30,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 4.0, left: 16),
                    //   child: Text(
                    //     "MONDAY",
                    //     style: TextStyle(
                    //         color: Colors.white70,
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                    Row(
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("assets/chest.png",
                                width: 30, height: 30, color: Colors.white)),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("assets/chest.png",
                                width: 30, height: 30, color: Colors.white)),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("assets/chest.png",
                                width: 30, height: 30, color: Colors.white)),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 733,
              left: 0,
              right: 0,
              child: Container(
                color: Color.fromARGB(255, 1, 217, 255),
                height: height * 0.1,
              ),
            ),
          ],
        ));
  }
}
