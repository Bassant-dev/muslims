import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/SharedFunctions.dart';
import '../../../core/appcolors.dart';
import 'salah_time/view model/time_cubit.dart';
import 'sebha/view/sebha_screen.dart';
import 'sebha/view_model/sebha_cubit.dart';
import 'stories_screen/view/stories_screen.dart';


class TheHome extends StatelessWidget {
  const TheHome({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit=BlocProvider.of<TimeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
      ),
      backgroundColor: AppColors.primarycolor,
      body: Column(
        children: [
          SizedBox(
              height: 130,
              child: StoriesScreen()
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color:AppColors.primarycolor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )],
            ),
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(// Set the same borderRadius as the container
                child: CircleAvatar(
                  backgroundColor:AppColors.mainColor,
                  child: Icon(
                    FlutterIslamicIcons.solidTasbih3, // Replace with Sebha icon
                    color: AppColors.primarycolor,
                    size: 50,
                  ),
                ),
                onTap: () {
                  SebhaCubit.get(context).loadData();
                  navto(context, SebhaScreen());
                },
              ),
            ),
          ),


        ],
      ),
    );
  }
}