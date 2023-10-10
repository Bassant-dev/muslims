

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/appcolors.dart';
import '../../viewmodel/AzkarCubit/AzkarCubit.dart';
import '../../viewmodel/AzkarCubit/AzkarStates.dart';
import '../widgets/MainAzkarCategoriesListView.dart';
import 'AzkarDetailsScreen.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    return  BlocConsumer<AzkarCubit,AzkarStates>(
      listener: (context,states){},
        builder: (context,states){
          var cubit = AzkarCubit.get(context);

          return Scaffold(

       /* appBar: AppBar(centerTitle: true, backgroundColor: AppColors.primaryColor,

            title: const Text('اذكاري ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold),)),*/
        body: Column(


          children: [

            Center(
              child: Container(
                width: 200.0.w, // specify the width
                height: 230.0.h, // specify the height
                child: Image.network(
                  'https://img.freepik.com/free-vector/hand-drawn-flat-design-prayer-mat-illustration_23-2149280347.jpg?w=740&t=st=1696703982~exp=1696704582~hmac=9cd610c90e1f3a6d24dbdafd57264554b813e41d46ea056950104131cb3b7904',
                  fit: BoxFit.cover, // ensure the image covers the space
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.r,vertical: 12.r),
              child: MainAzkarCategoriesListView()

            ),
          ],
        ),

      );
  }
    );
  }
}
