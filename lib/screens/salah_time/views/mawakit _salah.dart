import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/SharedFunctions.dart';
import '../../../core/appcolors.dart';
import '../../sebha/view/sebha_screen.dart';
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.h),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    // Set the same borderRadius as the container
                    child: const CircleAvatar(
                      backgroundColor: AppColors.mainColor,
                      child: Icon(
                        Icons.ac_unit_outlined, // Replace with Sebha icon
                        color: AppColors.primarycolor,
                        size: 40,
                      ),
                    ),
                    onTap: () {
                      navto(context, SebhaScreen());
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'مواقيت الصلاه',
                style: TextStyle(fontSize: 21.sp),
                textAlign: TextAlign.end,
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
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          child: Padding(
                            padding: EdgeInsets.all(10.0.r),
                            child: Row(
                              children: [
                                Text(cubit.times[index]),
                                const Spacer(),
                                Text(cubit.salah[index]),
                              ],
                            ),
                          ));
                    },
                    itemCount: cubit.salah.length,
                    physics: const BouncingScrollPhysics()),
              ),
            ],
          );
        },
      ),
    );
  }
}