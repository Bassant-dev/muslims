import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/appcolors.dart';
import '../../viewmodel/AzkarCubit/AzkarCubit.dart';

class AzkarDetailsListView extends StatelessWidget {
  const AzkarDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    var cubit=BlocProvider.of<AzkarCubit>(context);
    return ListView.builder(
      itemCount: cubit.azkarmodel!.content?.length ?? 0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var zekrData = cubit.azkarmodel!.content![index];

        return Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: Container(
            decoration: BoxDecoration(

              color: AppColors.containercolor,

              borderRadius: BorderRadius.circular(25.0.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  //offset: Offset(0, 2),
                  blurRadius: 7.0.r,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '  ${zekrData.zekr}',
                    textDirection: TextDirection.rtl,

                    style: TextStyle(
                      fontWeight: FontWeight.bold,


                    ),
                  ),
                  SizedBox(height: 8.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        decoration: BoxDecoration(
                          color:AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        // padding: EdgeInsets.all(16.0),
                        child: IconButton(
                          onPressed: () {
                            print("yessssssssssssssssssssssssssss");
                            Share.share('${zekrData.zekr}');
                          },
                          icon: Icon(Icons.share, color: Colors.white), // Adjust icon color if needed
                        ),
                      ),

                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        //  'rrrrrrrrruuuurrrrr',
                        'تكرار: ${zekrData.repeat}',
                        style: TextStyle(color: AppColors.primaryColor), // Adjust text color if needed
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
