import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:muslims/screens/home_screen/view/start_screen.dart';
import 'package:muslims/screens/home_screen/view_model/cubit/cubit.dart';
import 'package:muslims/screens/names_of_allah/view/names_of-allah_screen.dart';

import 'core/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
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
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
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

