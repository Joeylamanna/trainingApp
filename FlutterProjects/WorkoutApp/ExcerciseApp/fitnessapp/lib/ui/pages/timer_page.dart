// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  
  Timer? countdownTimer;
  var minupdate =  1;
  Duration myDuration = Duration(minutes: 1);

  @override
  // void initState() {
  //   super.initState();
  // }

  /// Timer related methods ///
  
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  
  void resetTimer() {
    //stopTimer();
    setState(() => myDuration = Duration(minutes: minupdate));
    //minupdate = 1;
  }

  void addMinutes() {
    setState(() => myDuration = Duration(minutes: ++minupdate));
  }
  void subtractMinutes() {
    setState(() => myDuration = Duration(minutes: --minupdate));
  }

  
  void setCountDown() {
    const reduceSecondsBy = 1;
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
    var minutes = strDigits(myDuration.inMinutes.remainder(60));
    var seconds = strDigits(myDuration.inSeconds.remainder(60));
    var time = '1';

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 217, 255),
        centerTitle: true,
        title: const Text(
          "Timer",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: ".SF UI Text",
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 90,
          ),
          // Step 8
          Text(
            time = '$minutes:$seconds',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 217, 255),
                fontSize: 100),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
             style: ButtonStyle(
              shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(width: 2, color: Color.fromARGB(255, 1, 217, 255)),
      ),
    ),
                 backgroundColor: MaterialStateProperty.all(
                     Color.fromARGB(255, 0, 0, 0))),
             onPressed: () {
               addMinutes();
             },
             child: const Text(
               '+1 Min',
               style: TextStyle(
                 color: Color.fromARGB(255, 1, 217, 255),
                 fontSize: 50,
               ),
             )),
             const SizedBox(
            height: 10,
          ),
              ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(width: 2, color: Color.fromARGB(255, 1, 217, 255)),
      ),
    ),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 0, 0, 0))),
              onPressed: () {
                subtractMinutes();
              },
              child: const Text(
                '-1 Min',
                style: TextStyle(
                  color:Color.fromARGB(255, 1, 217, 255),
                  fontSize: 50,
                ),
              )),
          
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            // ignore: prefer_const_constructors
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(width: 2, color: Color.fromARGB(255, 0, 170, 45),),
      ),
    ),
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 0, 0, 0))),
            onPressed: startTimer,
            child: const Text(
              'Start',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 170, 45),
                fontSize: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(width: 2, color: Color.fromARGB(255, 255, 0, 0)),
      ),
    ),
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 0, 0, 0))),
            onPressed: () {
              if (countdownTimer == null || countdownTimer!.isActive) {
                stopTimer();
              }
            },
            child: const Text(
              'Stop',
              style: TextStyle(
                color: Color.fromARGB(255, 254, 0, 0),
                fontSize: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(width: 2, color: Color.fromARGB(255, 254, 249, 249)),
      ),
    ),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 7, 8, 9))),
              onPressed: () {
                resetTimer();
              },
              child: const Text(
                'Reset',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 50,
                ),
              )),
          
        ]),
      ),
    );
  }
}
