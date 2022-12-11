import 'package:fitnessapp/ui/pages/records_page.dart';
import 'package:fitnessapp/ui/pages/timer_page.dart';
import 'package:fitnessapp/ui/pages/monday_workout.dart';
import 'package:fitnessapp/ui/pages/tuesday_workout.dart';
import 'package:fitnessapp/ui/pages/wednesday_workout.dart';
import 'package:fitnessapp/ui/pages/thursday_workout.dart';
import 'package:fitnessapp/ui/pages/friday_workout.dart';
import 'package:fitnessapp/ui/pages/saturday_workout.dart';
import 'package:fitnessapp/ui/pages/sunday_workout.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  int _selectedIndex = 0;

  final screens = [
    HomePage(),
    const TimerPage(),
    const RecordsPage(),
    const MondayPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    DateTime now = DateTime.now();
    //final now2 = DateTime.now();
    double hour = now.minute / 69;
    double nextHour = now.hour + 1;

    String formattedDate = DateFormat.MMMMEEEEd().format(DateTime.now());
    List<String> days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

    bool isSelected = false;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), //backround to black

      body: Stack(
        // //allows the state to be preserved when switching screens
        // index: 3,
        // // children: screens
        children: <Widget>[
          // screens,
          //Light Blue TOP BOX

          Positioned(
            top: 82,
            left: 20,
            right: 20,
            height: height * .35,
            child: const SizedBox(
              height: 310,
              child: Text(
                "User Info",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "SF UI Text",
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

          const Positioned(
            top: 120,
            height: 200,
            left: 55,
            right: 55,
            child: Text(
              "- Current Weight: 200lb\n- Curent Height: 6' 8''\n- Fastest Mile: 7:00",
              style: TextStyle(
                  color: Color.fromARGB(255, 1, 217, 255), fontSize: 20),
            ),
          ),

          Positioned(
            top: 220,
            left: 20,
            right: 20,
            height: height * .35,
            child: const SizedBox(
              height: 10,
              child: Text(
                "Goals",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "SF UI Text",
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

          const Positioned(
            top: 260,
            height: 200,
            left: 55,
            right: 55,
            child: Text(
              "- Run a 5k under 19:30min\n- Run a marathon under 3hrs\n- Climb Mount Everest",
              style: TextStyle(
                  color: Color.fromARGB(255, 1, 217, 255), fontSize: 20),
            ),
          ),

          //DATE
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            height: height * .35,
            child: SizedBox(
              height: 310,
              child: Text(
                formattedDate,
                style: const TextStyle(
                  color: Color.fromARGB(255, 88, 88, 88),
                  fontFamily: "SF UI Text",
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

          //Summary

          Positioned(
            top: 355,
            left: 20,
            right: 20,
            height: height * .6,
            child: const SizedBox(
              height: 310,
              child: Text("Workouts",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: "SF UI Text",
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  )),
            ),
          ),

          Positioned(
            top: 400,
            height: height * .4,
            left: 20,
            right: 20,
            child: IndexedStack(
              children: <Widget>[
                ListView.builder(
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        side:
                            BorderSide(color: Color.fromARGB(255, 1, 217, 255)),
                      ),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      child: SizedBox(
                        height: 75,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              textAlign: TextAlign.center,
                              days[index],
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 204, 255),
                                fontFamily: ".SF UI Text",
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onTap: () {
                              if (index == 0) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const MondayPage()));
                                setState(() {
                                  days.insert(index, 'updated value');
                                });
                              }
                              if (index == 1) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const TuesdayPage()));
                                setState(() {
                                  days.insert(index, 'updated value');
                                });
                              }
                              if (index == 2) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const WednesdayPage()));
                                setState(() {
                                  days.insert(index, 'updated value');
                                });
                              }
                              if (index == 3) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ThursdayPage()));
                                setState(() {
                                  days.insert(index, 'updated value');
                                });
                              }
                              if (index == 4) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const FridayPage()));
                                setState(() {
                                  days.insert(index, 'updated value');
                                });
                              }
                              if (index == 5) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const SaturdayPage()));
                                setState(() {
                                  days.insert(index, 'updated value');
                                });
                              }
                              if (index == 6) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const SundayPage()));
                                setState(() {
                                  days.insert(index, 'updated value');
                                });
                              }
                            },
                            onLongPress: () {
                              //                            <-- onLongPress
                              setState(() {
                                days.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
