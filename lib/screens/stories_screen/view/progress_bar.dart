
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyProgressBar extends StatelessWidget {
  MyProgressBar({super.key, required this.PercentWatched});
  double PercentWatched=0;
  @override
  Widget build(BuildContext context)
  {
    return LinearPercentIndicator(
      backgroundColor: Colors.white38, // Set the background color to transparent
      lineHeight: 10,
      barRadius: Radius.circular(7),
      percent: PercentWatched,
      progressColor: Colors.white,
    );
  }
}
