//import 'package:fitnessapp/ui/pages/profile_screen.dart';
import 'package:fitnessapp/ui/pages/home_page.dart';
import 'package:fitnessapp/ui/pages/timer_page.dart';
import 'package:fitnessapp/ui/pages/records_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
   

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  
  int _selectedIndex = 0;
  final screens = [
    HomePage(),
    TimerPage(),
    RecordsPage()
    ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
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
    )
    );
  }
}
