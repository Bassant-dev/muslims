import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:muslims/screens/home_screen/view_model/cubit/states.dart';

import '../../../names_of_allah/view/names_of-allah_screen.dart';
import '../../../qibla_screen/view/qibla_screen.dart';
import '../../view/home_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  final Dio dio = Dio();

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'الرئيسيه',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
          FlutterIslamicIcons.quran
      ),
      label: 'القرآن',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
          FlutterIslamicIcons.prayer
      ),
      label: 'الأذكار',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
          FlutterIslamicIcons.mosque
      ),
      label: 'أسماء الله الحسنى',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
          FlutterIslamicIcons.qibla
      ),
      label: 'القبلة',
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }
  final homeScreen =HomeScreen();
  final booksScreen = HomeScreen();
  final favouriteScreen = HomeScreen();
  final namesOfAllah =  NamesOfAllahScreen();
  final qibla = qiblaScreen();


  Widget getCurrentScreen() {
    switch (currentIndex) {
      case 0:
        return homeScreen;
      case 1:
        return booksScreen;
      case 2:
        return favouriteScreen;
      case 3:
        return namesOfAllah;
      default:
        return  qibla;
    }
  }



}