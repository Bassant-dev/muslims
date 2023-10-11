import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_offline/flutter_offline.dart';

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
            title: const Center(
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
          body: OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
                ) {
              if (connectivity == ConnectivityResult.none) {

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(
                        'Check Your Internet Connection!',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              } else {

                return cubit.getCurrentScreen();
              }
            },
            child: SizedBox(),
          ),
        );
      },
    );
  }
}
