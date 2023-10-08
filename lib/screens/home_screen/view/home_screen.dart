import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/cubit/cubit.dart';
import '../view_model/cubit/states.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) async {
      },
      builder: (context, state) {
        return Scaffold();
      },
    );
  }
}