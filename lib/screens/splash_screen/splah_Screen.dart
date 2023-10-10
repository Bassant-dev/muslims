import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../home_screen/view/start_screen.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => startScreen(),
        ),
      ),
    );
  }
//#XFFAF6
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#FFFAF6"), // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Image.asset(
              'assets/img/6628329.jpg',
              width: 400, // Adjust the width as needed
              height: 400, // Adjust the height as needed
            ),
            SizedBox(height: 20), // Add spacing between the image and text
            Text(
              'رفيق المسلم',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}