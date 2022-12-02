// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        
        bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
          items: [
          BottomNavigationBarItem( 
           icon: Icon(Icons.home, color:Color.fromARGB(255, 1, 217, 255)),
          label:  "Home", ),
           BottomNavigationBarItem( 
           icon: Icon(Icons.timer,color:Color.fromARGB(255, 1, 217, 255)),
          label:  "Timer", ),
          BottomNavigationBarItem( 
           icon: Icon(Icons.grade_outlined, color:Color.fromARGB(255, 1, 217, 255)),
          label:  "Personal Records ", ),
        ],
      ),
        
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
                  bottom: const Radius.circular(40),
                ),
                child: Container(
                  color: Color.fromARGB(255, 1, 217, 255),
                ),
              ),
            )
          ],
        ));
  }
}
