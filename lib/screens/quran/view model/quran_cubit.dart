import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../core/dio.dart';
import '../model/surahModel.dart';


part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  SurahModel ?surahModel;
  getSurahOfQuran()async
  {
       try {
         Response response=await DioHelper.getData2(url: 'surah');
         surahModel=SurahModel.fromJson(response.data);
         emit(GetSurahOfQuranSuccess());
       } on Exception catch (e) {
         print(e.toString());
         emit(GetSurahOfQuranFailed());
       }
  }
}
