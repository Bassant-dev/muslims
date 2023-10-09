import 'package:flutter/material.dart';
import 'package:muslims/screens/quran/views/widgets/surah_view_body.dart';
import '../model/surahModel.dart';
class SurahView extends StatelessWidget {
  const SurahView({Key? key, required this.model, }) : super(key: key);
  final Datum model;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(backgroundColor: const Color(0xff6A9C89)),
      body:
     SafeArea(
       child:SurahViewBody(model: model) ),
     );
  }
}
