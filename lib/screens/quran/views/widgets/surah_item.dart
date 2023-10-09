import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class SurahItem extends StatelessWidget {
  const SurahItem({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor("#FEFBE9"),
      elevation: 3, // Add a shadow to the card
      margin: EdgeInsets.all(8.r), // Add some margin around the card
      child: ListTile(
        title: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Set text color to black
          ),
        ),

      ),
    );
  }
}
