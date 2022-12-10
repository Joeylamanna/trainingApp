import 'package:fitnessapp/ui/pages/monday_workout.dart';
import 'package:fitnessapp/ui/pages/records_page.dart';
import 'package:fitnessapp/ui/pages/timer_page.dart';
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
    TimerPage(),
    RecordsPage(),
    MondayPage(),
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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0), //backround to black

      body: Stack(
        // //allows the state to be preserved when switching screens
        // index: 3,
        // // children: screens
        children: <Widget>[
          // screens,
          //Light Blue TOP BOX
          Positioned(
            top: 150,
            height: 200,
            left: 100,
            right: 100,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: const CircularProgressIndicator.adaptive(
                  value: .5,
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 1, 217, 255),
                  )),
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
            top: 80,
            left: 20,
            right: 20,
            height: height * .35,
            child: const SizedBox(
              height: 310,
              child: Text(
                "Summary",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "SF UI Text",
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

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
                      color: Color.fromARGB(255, 0, 0, 0),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MondayPage()));
                              setState(() {
                                days.insert(index, 'updated value');
                              });
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

          // child: ListView(
          //   scrollDirection: Axis.vertical,
          //   // addAutomaticKeepAlives: false,
          //   // padding: const EdgeInsets.all(10),
          //   children: <Widget>[
          //     Expanded(
          //       child: GestureDetector(
          //         onTap: () {
          //           Navigator.of(context).push(
          //             MaterialPageRoute(
          //               builder: (context) => const MondayPage(),
          //               // currentIndex: _selectedIndex,
          //             ),
          //           );
          //         },
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20.0),
          //             gradient: const LinearGradient(
          //               begin: Alignment.topCenter,
          //               end: Alignment.bottomCenter,
          //               colors: <Color>[
          //                 Color.fromARGB(255, 1, 217, 255),
          //                 Colors.black
          //               ],
          //             ),
          //           ),
          //           height: 100,
          //           // color: Color.fromARGB(255, 1, 217, 255),
          //           child: const Center(
          //             child: Text(
          //               "Monday",
          //               style: TextStyle(
          //                 color: Color.fromARGB(255, 255, 255, 255),
          //                 fontFamily: ".SF UI Text",
          //                 fontSize: 30,
          //                 fontWeight: FontWeight.w300,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20.0),
          //         gradient: const LinearGradient(
          //             begin: Alignment.topCenter,
          //             end: Alignment.bottomCenter,
          //             colors: <Color>[
          //               Color.fromARGB(255, 1, 217, 255),
          //               Colors.black
          //             ]),
          //       ),
          //       height: 100,
          //       // color: Color.fromARGB(255, 1, 217, 255),
          //       child: const Center(
          //           child: Text('Tuesday',
          //               style: TextStyle(
          //                 color: Color.fromARGB(255, 255, 255, 255),
          //                 fontFamily: ".SF UI Text",
          //                 fontSize: 30,
          //                 fontWeight: FontWeight.w300,
          //               ))),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20.0),
          //         gradient: const LinearGradient(
          //             begin: Alignment.topCenter,
          //             end: Alignment.bottomCenter,
          //             colors: <Color>[
          //               Color.fromARGB(255, 1, 217, 255),
          //               Colors.black
          //             ]),
          //       ),
          //       height: 100,
          //       // color: Color.fromARGB(255, 1, 217, 255),
          //       child: const Center(
          //           child: Text('Wednesday',
          //               style: TextStyle(
          //                 color: Color.fromARGB(255, 255, 255, 255),
          //                 fontFamily: ".SF UI Text",
          //                 fontSize: 30,
          //                 fontWeight: FontWeight.w300,
          //               ))),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20.0),
          //         gradient: const LinearGradient(
          //             begin: Alignment.topCenter,
          //             end: Alignment.bottomCenter,
          //             colors: <Color>[
          //               Color.fromARGB(255, 1, 217, 255),
          //               Colors.black
          //             ]),
          //       ),
          //       height: 100,
          //       // color: Color.fromARGB(255, 1, 217, 255),
          //       child: const Center(
          //           child: Text('Thursday',
          //               style: TextStyle(
          //                 color: Color.fromARGB(255, 255, 255, 255),
          //                 fontFamily: ".SF UI Text",
          //                 fontSize: 30,
          //                 fontWeight: FontWeight.w300,
          //               ))),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20.0),
          //         gradient: const LinearGradient(
          //             begin: Alignment.topCenter,
          //             end: Alignment.bottomCenter,
          //             colors: <Color>[
          //               Color.fromARGB(255, 1, 217, 255),
          //               Colors.black
          //             ]),
          //       ),
          //       height: 100,
          //       // color: Color.fromARGB(255, 1, 217, 255),
          //       child: const Center(
          //           child: Text('Friday',
          //               style: TextStyle(
          //                 color: Color.fromARGB(255, 255, 255, 255),
          //                 fontFamily: ".SF UI Text",
          //                 fontSize: 30,
          //                 fontWeight: FontWeight.w300,
          //               ))),
          //     ),
          //   ],
          // ),
        ],
      ),
    );

    // ));
  }
}
