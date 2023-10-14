import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:workmanager/workmanager.dart';
import '../home_screen/view/start_screen.dart';

class StaticDo3a2 {
  List<String> smallDo3a2 = [
    'اللَّهُمَّ إنِّي أَسْأَلُكَ الهُدَى وَالتُّقَى، وَالْعَفَافَ وَالْغِنَى',
    'رَبَّنَا أَتْمِمْ لَنَا نُورَنَا وَاغْفِرْ لَنَا ۖ إِنَّكَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
    'رَّبِّ أَنزِلْنِي مُنزَلًا مُّبَارَكًا وَأَنتَ خَيْرُ الْمُنزِلِينَ',
    'لَّا إِلَٰهَ إِلَّا أَنتَ سُبْحَانَكَ إِنِّي كُنتُ مِنَ الظَّالِمِينَ',
    'رَّبِّ زِدْنِي عِلْمًا',
    'رَبِّ هَبْ لِي مِن لَّدُنكَ ذُرِّيَّةً طَيِّبَةً ۖ إِنَّكَ سَمِيعُ الدُّعَاءِ',
    'رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِن لَّدُنكَ رَحْمَةً',
    'قَالَ رَبِّ اشْرَحْ لِي صَدْرِي*وَيَسِّرْ لِي أَمْرِي',
    'اللَّهمَّ إنِّي أعوذُ بِك من شرِّ ما عَمِلتُ ، ومن شرِّ ما لم أعمَلْ',
    'رَبِّ نَجِّنِي مِنَ الْقَوْمِ الظَّالِمِينَ',
    'رَبِّ هَبْ لِي حُكْمًا وَأَلْحِقْنِي بِالصَّالِحِينَ',
    'رَّبِّ أَعُوذُ بِكَ مِنْ هَمَزَاتِ الشَّيَاطِينِ',
    'اللَّهمَّ أحسَنتَ خَلقي فأحسِن خُلُقي',
    'رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِن ذُرِّيَّتِي ۚ رَبَّنَا وَتَقَبَّلْ دُعَاءِ',
    'رَبَّنَا تَقَبَّلْ مِنَّا إِنَّكَ أَنْتَ السَّمِيعُ الْعَلِيمُ',
    'وَتُبْ عَلَيْنَا إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيمُ',
    'اللَّهُمَّ أعنَّا على شُكْرِكَ وذِكْرِكَ، وحُسنِ عبادتِكَ',
    'اللهمَّ اكفِنِي بحلالِكَ عن حرَامِكَ، وأغْنِنِي بفَضْلِكَ عمَّن سواكَ',
    'رَبَّنَا آتِنَا مِن لَّدُنكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا',
  ];
}

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future showNotification() async
{
  int rndmIndex = Random().nextInt(StaticDo3a2().smallDo3a2.length - 1);
  AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    '$rndmIndex',
    'تطبيق المسلم',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    enableVibration: true,
  );
  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin?.show(
      rndmIndex,
      'رفيق المسلم',
      StaticDo3a2().smallDo3a2[rndmIndex],
      platformChannelSpecifics

  );
}

void callbackDispatcher()
{
  // initial notifications
  var initializationSettingsAndroid =
  const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  WidgetsFlutterBinding.ensureInitialized();
  flutterLocalNotificationsPlugin?.initialize(initializationSettings);
  Workmanager().executeTask((task, inputData)
  {
    showNotification();
    return Future.value(true);
  });
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => startScreen(),
        ),
      ),
    );
    Workmanager().initialize(callbackDispatcher,isInDebugMode: true);
  }

//#XFFAF6
  @override
  Widget build(BuildContext context) {
    Workmanager().registerPeriodicTask(
      "1",
      "periodic Notification",
      frequency: const Duration(minutes: 15),
    );

    return Scaffold(
      backgroundColor: HexColor("#FFFAF6"), // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Image.asset(
              'assets/img/6628329.jpg',
              width: 400.w, // Adjust the width as needed
              height: 400.h, // Adjust the height as needed
            ),
            SizedBox(height: 20.h), // Add spacing between the image and text
            Text(
              'رفيق المسلم',
              style: TextStyle(
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
