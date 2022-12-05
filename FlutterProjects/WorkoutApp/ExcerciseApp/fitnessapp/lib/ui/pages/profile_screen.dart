// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
   
    return Scaffold(
       
        backgroundColor: Color.fromARGB(255, 0, 0, 0), //backround to black

        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          child: BottomNavigationBar(
            iconSize: 40,
            currentIndex: 0,
            unselectedItemColor: Color.fromARGB(255, 1, 217, 255),
            selectedItemColor: Color.fromARGB(255, 255, 255, 255),
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            selectedFontSize: 20,
            
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.timer,
                ),
                label: "Timer",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.grade_outlined,
                ),
                label: " Records ",
              ),
            ],
          ),
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
