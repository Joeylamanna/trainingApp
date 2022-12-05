import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0), //backround to black
        body: Stack(
          children: <Widget>[
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

