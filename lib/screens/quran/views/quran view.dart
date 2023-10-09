import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslims/screens/quran/views/surah_view.dart';
import 'package:muslims/screens/quran/views/widgets/surah_item.dart';

import '../view model/quran_cubit.dart';

class QuranView extends StatelessWidget {
  const QuranView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<QuranCubit>(context);
          return   cubit.surahModel?.data==null ?
          const Center(child: CircularProgressIndicator(color:Color(0xff6A9C89) ),):
          ListView.builder(itemCount: cubit.surahModel?.data.length,
              itemBuilder: (context, index) {
          return  InkWell(onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SurahView(model: cubit.surahModel!.data[index])));
            },
              child:SurahItem(name: cubit.surahModel!.data[index].name),
            );

          });
        },
      ),
    );
  }
}
