import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../view_model/cubit/cubit.dart';
import '../view_model/cubit/states.dart';

class startScreen extends StatelessWidget {
  static String id = 'start';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: HexColor("#6A9C89"),
            title: Center(
              child: Text(
                'رفيق المسلم',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
          body: cubit.getCurrentScreen(), // Use getCurrentScreen() from StoreCubit
        );
      },
    );
  }
}
