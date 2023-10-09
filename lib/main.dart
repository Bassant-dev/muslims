import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:muslims/core/dio.dart';
import 'package:muslims/screens/home_screen/view/start_screen.dart';
import 'package:muslims/screens/home_screen/view_model/cubit/cubit.dart';
import 'package:muslims/screens/quran/view%20model/quran_cubit.dart';
import 'package:muslims/screens/salah_time/view%20model/time_cubit.dart';
import 'core/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init1();
  await DioHelper.init2();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> HomeCubit()),
        BlocProvider(create: (context)=>TimeCubit()..getPermission()..getCurrentLocation()),
        BlocProvider(create: (context)=>QuranCubit()..getSurahOfQuran())
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rafik Al Muslim',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor:HexColor("#6A9C89")),
            useMaterial3: true,
            bottomNavigationBarTheme:  BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor:HexColor("#FEFBE9"),
              unselectedItemColor: Colors.black,
              elevation: 20.0,
              backgroundColor:HexColor("#6A9C89") ,
            ),
            textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
          ),
          home:startScreen(),
        ),
      ),
    );
  }
}
