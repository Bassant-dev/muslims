import 'package:flutter/material.dart';
import '../../model/surahModel.dart';
import 'ayat_surah.dart';
class SurahViewBody extends StatelessWidget {
  const SurahViewBody({Key? key, required this.model}) : super(key: key);
  final Datum model;
  @override
  Widget build(BuildContext context) {
    return AyatOfSurah(model: model);
  }
}

