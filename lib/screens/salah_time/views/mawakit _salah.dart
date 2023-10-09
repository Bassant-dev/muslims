import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../view model/time_cubit.dart';
class SalahTimeView extends StatelessWidget {
  const SalahTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TimeCubit, TimeState>(
        builder: (context, state) {
          var cubit=BlocProvider.of<TimeCubit>(context);
          return cubit.salahTimeModel==null ?
           const Center(child: CircularProgressIndicator(color: Color(0xff6A9C89)),):
          Padding(
            padding:  EdgeInsets.all(10.0.r),
            child: Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                 Text('مواقيت الصلاه',
                   style: TextStyle(fontSize: 21.sp),textAlign: TextAlign.end,),
                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index)
                      {
                        return  Card(margin:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                            child: Padding(
                          padding:  EdgeInsets.all(10.0.r),
                          child: Row(
                            children: [
                              Text(cubit.times[index]),
                           const  Spacer(),
                              Text(cubit.salah[index]),

                          ],),
                        ));
                      },
                      itemCount: cubit.salah.length,
                      physics: const BouncingScrollPhysics()),
                ),

              ],
            ),
          );
        },
      ),);
  }
}
