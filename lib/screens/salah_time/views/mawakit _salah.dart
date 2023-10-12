import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/SharedFunctions.dart';
import '../../../core/appcolors.dart';
import '../../sebha/view/sebha_screen.dart';
import '../../sebha/view_model/sebha_cubit.dart';
import '../../stories_screen/view/stories_screen.dart';
import '../view model/time_cubit.dart';

class SalahTimeView extends StatelessWidget {
  const SalahTimeView({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TimeCubit>(context);

    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      body: BlocBuilder<TimeCubit, TimeState>(
        builder: (context, state) {
          return Column(

            children: [
              SizedBox(height: 150.h, child: StoriesScreen()),
              Text(
                'السبحة',
                style: TextStyle(fontSize: 21.sp),
                textAlign: TextAlign.start, // Align to the start
              ),
              SizedBox(height: 15.h),
              Container(
                height: 70.h,
                width: 70.w,
                child: GestureDetector(
                  onTap: () {
                    SebhaCubit.get(context).loadData();
                    navto(context, SebhaScreen());
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.mainColor,
                    child: Icon(
                      FlutterIslamicIcons.solidTasbih3, // Replace with Sebha icon
                      color: AppColors.primarycolor,
                      size: 50,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10.h,
              ),
              Text(
                'مواقيت الصلاه',
                style: TextStyle(fontSize: 21.sp),
                textAlign: TextAlign.start, // Align to the start
              ),

              SizedBox(
                height: 10.h,
              ),
              cubit.salahTimeModel?.data == null
                  ? state is TimeLoading ?
              Center(
                child: SizedBox(width: MediaQuery.of(context).size.width*0.65,
                  child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Color(0xff6A9C89))),
                    onPressed: () {
                      cubit.getLocation();
                    },
                    child:

                    Center(
                      child: SizedBox(width: 24.w,height: 24.h,
                          child: const CircularProgressIndicator(color: Colors.white)),
                    ),
                  ),
                ),
              ):
              Center(
                child: SizedBox(width: MediaQuery.of(context).size.width*0.65,
                  child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Color(0xff6A9C89))),
                    onPressed: () {
                      cubit.getLocation();
                    },
                    child:

                    const Center(
                      child: Text('السماح للوصول للموقع',
                          style:
                          TextStyle(fontSize: 21, color: Colors.black)),
                    ),
                  ),
                ),
              ):
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5, // Add elevation for a shadow effect
                      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0), // Rounded corners
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.0.r), // Increased padding
                        child: Row(
                          children: [
                            Text(
                              cubit.times[index],
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              cubit.salah[index],
                              style: TextStyle(
                                fontSize: 18.sp,
                                color:Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: cubit.salah.length,
                  physics: BouncingScrollPhysics(),
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}