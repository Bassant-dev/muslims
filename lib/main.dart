import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:muslims/core/dio.dart';
import 'package:muslims/screens/Azkar/viewmodel/AzkarCubit/AzkarCubit.dart';
import 'package:muslims/screens/home_screen/view_model/cubit/cubit.dart';
import 'package:muslims/screens/quran/view%20model/quran_cubit.dart';
import 'package:muslims/screens/salah_time/view%20model/time_cubit.dart';
import 'package:muslims/screens/sebha/view_model/sebha_cubit.dart';
import 'package:muslims/screens/splash_screen/splah_Screen.dart';
import 'package:muslims/screens/stories_screen/view_model/stories_cubit.dart';
import 'package:muslims/screens/stories_screen/view_model/story_cubit.dart';
import 'core/bloc_observer.dart';
import 'core/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications().initialize(
      null, [
    NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests'),

  ]);

  // await Firebase.initializeApp();
  // await FirebaseApi().initNotification();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.init1();
  await DioHelper.init2();
  await DioHelper.Init3();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => TimeCubit()..getLocation()),
        BlocProvider(create: (context) => QuranCubit()..getSurahOfQuran()),
        BlocProvider(create: (context) => AzkarCubit()),
        BlocProvider(create: (context) => SebhaCubit()..loadData()),
        BlocProvider(create: (context) => StoriesCubit()..getrandomlist()),
        BlocProvider(create: (context) => StoryCubit())
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rafik Al Muslim',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: HexColor("#6A9C89")),
            useMaterial3: true,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: HexColor("#FEFBE9"),
              unselectedItemColor: Colors.black,
              elevation: 20.0,
              backgroundColor: HexColor("#6A9C89"),
            ),
            textTheme:
                GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
          ),
          home: MyHomePage(),
        ),
      ),
    );
  }
}
