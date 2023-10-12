import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/appcolors.dart';
import '../../../core/cache_helper.dart';
part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(SebhaInitial());

  static SebhaCubit get(context) => BlocProvider.of(context);
  int? count ;
  int? sum ;
  Color? selectedzekrcolor=AppColors.fifthcolor;
  String?selectedzekr="الحمدللّه";
  int?selectedzekrindex=0;
  List<String> zekr=
  [
    "الحمدللّه", "سبحان اللّه",
    "لا اله الا اللّه", "اللّه اكبر",
    "أستغفر اللّه العظيم و اتوب اليه",
    "اللّهم صلّ على خير خلق اللّه",
  ];
  List<Color> zekrcolor=
  [
    AppColors.fifthcolor,
    AppColors.sexthcolor,
    AppColors.seventhcolor,
    AppColors.eighthcolor,
    AppColors.ninthcolor,
    AppColors.tenthcolor
  ];
  List<int> zekrcounter=
  [
    0,
    0,
    0,
    0,
    0,
    0
  ];
  void loadData() async {
    count = CacheHelper.getData(key: 'counter') ?? 0;
    sum = CacheHelper.getData(key: 'sum') ?? 0;
    selectedzekrindex=0;
    emit(SebhaInitial());
    print("selected zekr index: $selectedzekrindex");
  }

  void Increment(int indexzekr) async {
    emit(SebhaLoading());
    count=zekrcounter[indexzekr];
    count=count!+1;
    sum=sum!+ 1;
    emit(SebhaIncrementSuccess());
    zekrcounter[indexzekr]=count!;
    CacheHelper.saveData(key: 'counter', value: count);
    CacheHelper.saveData(key: 'sum', value: sum);
  }

  void Resetcounter(int zekrindexx) async {
    emit(SebhaLoading());
    count = 0;
    zekrcounter[zekrindexx]=count!;
    emit(SebhaResetCounterSuccess());
    CacheHelper.saveData(key: 'counter', value: count);
    CacheHelper.saveData(key: 'sum', value: sum);
  }

  void Resetsum(int zekrindexx) async {
    emit(SebhaLoading());
    count = 0;
    sum = 0;
    emit(SebhaResetSumSuccess());
    for (int i = 0; i < zekrcounter.length; i++) {
      zekrcounter[i] = 0;
    }
    zekrcounter[zekrindexx]=count!;
    CacheHelper.saveData(key: 'counter', value: count);
    CacheHelper.saveData(key: 'sum', value: sum);
  }

  String displayzekr(int zekrindex)
  {
    return zekr[zekrindex];
  }
  void displayzekrcolor(int zekrindex)
  {
    emit(Sebhachangezekrcolor());
    selectedzekrcolor=zekrcolor[zekrindex];
    selectedzekr=zekr[zekrindex];
    selectedzekrindex=zekrindex;

  }
}