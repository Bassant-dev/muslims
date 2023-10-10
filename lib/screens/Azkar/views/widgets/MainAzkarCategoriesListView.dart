
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/appcolors.dart';
import '../../viewmodel/AzkarCubit/AzkarCubit.dart';
import '../screens/AzkarDetailsScreen.dart';

class MainAzkarCategoriesListView extends StatelessWidget {
  const MainAzkarCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    var cubit=BlocProvider.of<AzkarCubit>(context);
    return  ListView.separated(
      shrinkWrap: true,
      itemCount: cubit.azkari.length,
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemBuilder: (context, index) =>
          GestureDetector(onTap: () {
            print(index);
            cubit.azkarmodel=null;

            if(index==0) {
              cubit.GetMoringAzkar();
              //
            }
            else if(index==1) {

              AzkarCubit.get(context).GetEveningAzkar();
            }
            else if(index==2) {

              AzkarCubit.get(context).GetPostprayerAzkar();
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AzkarDetailsScreen(),
              ),
            );

          },
            child: Container(
              child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${cubit.azkari[index].title}',

                      style: TextStyle(

                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          color: Colors.black),
                    ),
                    SizedBox(width: 20.w,),


                  ]),
              width: double.infinity,
              height: 80.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(45.r)),),
          ),
    );
  }
}
