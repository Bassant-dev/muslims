import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart' as quran;
import '../../model/surahModel.dart';
class AyatOfSurah extends StatelessWidget {
  const AyatOfSurah({
    super.key,
    required this.model,
  });
  final Datum model;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
       SizedBox(
        height: 5.h,
      ),
      Padding(
        padding:  EdgeInsets.all(8.0.r),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              for (var i = 1; i <=model.numberOfAyahs; i++) ...{
                TextSpan(
                  text:
                  quran.getVerse(model.number, i, verseEndSymbol: true) ,
                  style:   TextStyle(color: Colors.black,
                    fontFamily: 'Kitab',
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    ]);
  }
}
