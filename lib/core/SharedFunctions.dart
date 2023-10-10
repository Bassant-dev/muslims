import 'package:flutter/material.dart';

void navto(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navback(BuildContext context) {
  Navigator.pop(context);
}