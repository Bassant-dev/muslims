import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dio.dart';
import '../../models/AzkarModel/AzkarModel.dart';
import '../../models/MainAzkarCategoriesModel/AzkarCategories.dart';
import 'AzkarStates.dart';





class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit() : super(AzkarInitialState());



  static AzkarCubit get(context) => BlocProvider.of<AzkarCubit>(context);
  List<AzkarCategories>azkari=
  [
    AzkarCategories(title: 'اذكار الصباح'),
    AzkarCategories(title: 'اذكار المساء' ),
    AzkarCategories(title: 'اذكار  بعد الصلاه'),
  ];
  AzkarModel? azkarmodel;
  void GetMoringAzkar(){

    emit(GetMorningLoadingState());
    DioHelper.getDataAzkar(
      url: 'azkar_sabah.json',


    ).then((response) {

      azkarmodel = AzkarModel.fromJson(response.data);
      print("GET moring DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
      /*if(azkarmodel!.data!=null) {
        if(azkarmodel!.data!.cartItems?.isEmpty==true) {
          print("Cart is empty");

        }
        else  if(cartmodel!.data!.cartItems?.isEmpty==false) {
          print("cart is full");
          /*for (var item in favouritemodel!.data!.product!) {
            try {
              favourites.add((item));
            } catch (e) {
              favourites.add((item));
            }
          }

          for (var item in favouritemodel!.data!.product!) {
            try {
              favouritesIds.add((item.id).toString());
            } catch (e) {
              favouritesIds.add((item.id).toString());
            }
          }*/




        }
      }*/



      emit(GetMorningSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr IN GET morning azkar");
      //   print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(GetMorningErrorState(error.toString()));
    });
  }

  void GetEveningAzkar
      (){
    emit(GetEveningLoadingState());
    DioHelper.getDataAzkar(
      url: 'azkar_massa.json',


    ).then((response) {

      azkarmodel = AzkarModel.fromJson(response.data);
      print("GET evening DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);
      /*if(azkarmodel!.data!=null) {
        if(azkarmodel!.data!.cartItems?.isEmpty==true) {
          print("Cart is empty");

        }
        else  if(cartmodel!.data!.cartItems?.isEmpty==false) {
          print("cart is full");
          /*for (var item in favouritemodel!.data!.product!) {
            try {
              favourites.add((item));
            } catch (e) {
              favourites.add((item));
            }
          }

          for (var item in favouritemodel!.data!.product!) {
            try {
              favouritesIds.add((item.id).toString());
            } catch (e) {
              favouritesIds.add((item.id).toString());
            }
          }*/




        }
      }*/



      emit(GetEveningSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr IN GET evening azkar");
      //   print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(GetEveningErrorState(error.toString()));
    });
  }
//Get  post prayer azkar
  void GetPostprayerAzkar
      (){
    emit(GetPostprayerAzkarLoadingState());
    DioHelper.getDataAzkar(
      url: 'PostPrayer_azkar.json',


    ).then((response) {

      azkarmodel = AzkarModel.fromJson(response.data);
      print("GET post prayer DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      print(response.data);



      emit(GetPostprayerAzkarSuccessState());
    }).catchError((error){
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr IN GET post prayer azkar");
      //   print(error.response);
      print("Error: $error");
      if (error is DioError && error.response?.statusCode == 422) {
        final responseData = error.response?.data;
        if (responseData != null && responseData.containsKey('errors')) {
          final errors = responseData['errors'];
        }



      }
      emit(GetPostprayerAzkarErrorState(error.toString()));
    });
  }
}
