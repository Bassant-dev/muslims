import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../core/appcolors.dart';
import '../../viewmodel/AzkarCubit/AzkarCubit.dart';
import '../../viewmodel/AzkarCubit/AzkarStates.dart';
import '../widgets/AzkarDetailsListView.dart';

class AzkarDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    //  final azkarCubit = BlocProvider.of<AzkarCubit>(context);/
   // azkarCubit.fetchAzkar();

    return BlocConsumer<AzkarCubit, AzkarStates>(
      listener: (context,states){

      },
        builder: (context,states) {
          var cubit =AzkarCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,

          title:
          (cubit.azkarmodel!=null)?

          Center(
            child: Text(
                cubit.azkarmodel!.title!,
              style: TextStyle(

                color: Colors.black
              ),
            ),
          ):
          Center(
            child: Text(
              "اذكار",
              style: TextStyle(

                  color: Colors.black
              ),

            ),

          ),

        ),
        body: (cubit.azkarmodel!=null)?

          SingleChildScrollView(
            child: Column(
              children: [
                AzkarDetailsListView(),


                ElevatedButton(
                  onPressed: () {

                    QuickAlert.show(title: '🎉احسنت',confirmBtnText: 'اكمل رحلتك',
                        confirmBtnColor: Colors.green,
                        text: 'تقبل الله منا ومنكم ',
                        context: context, type:
                        QuickAlertType.success);

                  },
                  style: ElevatedButton.styleFrom(
                    primary:AppColors.primaryColor,
                    minimumSize: Size(200, 50),

                  ),
                  child: Text('انهيت الاذكار'),
                )
              ],
            ),
          ): Center(
            child: CircularProgressIndicator(),
          ),


            );}
    );


  }
}