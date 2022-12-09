//import 'package:fitnessapp/ui/pages/profile_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitnessapp/ui/pages/home_page.dart';
import 'package:fitnessapp/ui/pages/timer_page.dart';
import 'package:fitnessapp/ui/pages/records_page.dart';
import 'package:fitnessapp/ui/pages/monday_workout.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyStatefulWidget(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   static const String _title = 'Flutter Code Sample';

//   @override
//   // State<MyApp> createState() = _MyState();

//   @override
//   // Widget build(BuildContext context) {
//   //   return const MaterialApp(
//   //     title: _title,
//   //     home: MyStatefulWidget(),
//   //   );
//   // }
// }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
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
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("welcome")),
  //       body: FutureBuilder(
  //     future: _fApp,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Text("something wrong");
  //       } else if (snapshot.hasData) {
  //         return const Text(
  //           "firebase is ready bitches",
  //           style: TextStyle(fontSize: 30),
  //         );
  //       } else {
  //         return CircularProgressIndicator();
  //       }
  //     },
  //   ));
  // }


     Widget build(BuildContext context)  {
       //DatabaseReference _testRef = FirebaseDatabase.instance.ref().child('record');
      return Scaffold(
        body: IndexedStack(
        index: _selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: ClipRRect(
          child: BottomNavigationBar(
            iconSize: 40,
            currentIndex: _selectedIndex,
            unselectedItemColor: const Color.fromARGB(255, 1, 217, 255),
            selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            selectedFontSize: 20,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.timer),
                label: 'Timer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grade_outlined),
                label: 'Records',
              ),
            ],
            onTap: _onItemTapped,
          ),
        ));
      

     } 
}
          

