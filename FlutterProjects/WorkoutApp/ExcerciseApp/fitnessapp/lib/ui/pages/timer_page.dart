// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  // Step 2
  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 3);
  @override
  

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(minutes: 3));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    // Step 7
    var minutes = strDigits(myDuration.inMinutes.remainder(3));
    var seconds = strDigits(myDuration.inSeconds.remainder(60));
  
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 217, 255),
        title: const Text("Timer"),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 215,
          ),
          // Step 8
          Text(
            '$minutes:$seconds',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 217, 255),
                fontSize: 100),
          ),
          const SizedBox(height: 20),
          // Step 9
          ElevatedButton(
            // ignore: prefer_const_constructors
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 1, 217, 255))),
            onPressed: startTimer, 
            child: const Text(
              'Start',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 30,
              ),
            ),
          ),
          // Step 10
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 1, 217, 255))),
            onPressed: () {
              if (countdownTimer == null || countdownTimer!.isActive) {
                stopTimer();
              }
            },
            child: const Text(
              'Stop',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 30,
              ),
            ),
          ),
          // Step 11
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 1, 217, 255))),
              onPressed: () {
                resetTimer();
              },
              child: const Text(
                'Reset',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30,
                ),
              )),
              
        ]),
      ),
    );
  }
}
