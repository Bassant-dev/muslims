import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

import '../../../core/dio.dart';
import '../model/salah time model.dart';


part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  TimeCubit() : super(TimeInitial());
  List<String> salah = [
    ' الفجر',
    'الظهر',
    'العصر',
    'المغرب',
    'العشاء',
  ];
//   bool ?isServiceEnabled;
// LocationPermission ?permission;
//   Future getPermission() async {
//     //permission=await Geolocator.checkPermission();
//      isServiceEnabled = await Location.isLocationServiceEnabled();
//     if (isServiceEnabled==false )
//     {
//       await Geolocator.requestPermission();
//     }
//
//   }

  Location location =  Location();

  bool serviceEnabled=false;

  PermissionStatus ?permissionGranted;
  LocationData ?locationData;

  getLocation()async
  {
    emit(TimeLoading());
    serviceEnabled = await location.serviceEnabled();
    if(serviceEnabled)
    {
      locationData = await location.getLocation();
      getPrayerTime();
    }
    if (serviceEnabled==false)
    {
      serviceEnabled = await location.requestService();
      if(serviceEnabled)
      {
        locationData=await location.getLocation();
        getPrayerTime();
      }
    }
    print(locationData?.latitude);
    print(locationData?.longitude);

    emit(GetCurrentLocationSuccess());
  }
  getPrayerTime() async {
    try {
      DateTime date=DateTime.now();
      Response response = await DioHelper.getData(
          url:
          '${date.day}-${date.month}-${date.year}?latitude=${locationData?.latitude}&longitude=${locationData?.longitude}');
      salahTimeModel=SalahTimeModel.fromJson(response.data);
      var data={
        'Fajr':replaceNumbersToArabic(salahTimeModel!.data.timings.fajr),
        'Dhuhr':replaceNumbersToArabic(salahTimeModel!.data.timings.dhuhr),
        'Asr':replaceNumbersToArabic(convertTo12HourFormat(salahTimeModel!.data.timings.asr)),
        'Maghrib':replaceNumbersToArabic(convertTo12HourFormat(salahTimeModel!.data.timings.maghrib)),
        'Isha':replaceNumbersToArabic(convertTo12HourFormat(salahTimeModel!.data.timings.isha))
      };
      data.entries.map((e) {
        times.add(e.value);
      }).toList();
      emit(GetPrayerTimeSuccess());

    } on Exception catch (e)
    {
      print(e.toString());
      emit(GetPrayerTimeFailed());
    }

  }

  //  double latUser=0.0;
  //  double longUser=0.0;
  // getCurrentLocation() async {
  //     await Geolocator.getCurrentPosition().then((value)
  //    {
  //    latUser=value.latitude;
  //     longUser=value.longitude;
  //     print(latUser);
  //     print(longUser);
  //     getPrayerTime();
  //      emit(GetCurrentLocationSuccess());
  //    }).catchError((error) {
  //      print(error.toString());
  //      emit(GetCurrentLocationFailed());
  //    });
  //  }
  SalahTimeModel ?salahTimeModel;
  String convertTo12HourFormat(String timeString) {
    final inputFormat = DateFormat('HH:mm');
    final outputFormat = DateFormat('hh:mm');
    final time = inputFormat.parse(timeString);
    final convertedTime = outputFormat.format(time);
    print(convertedTime);
    return convertedTime;
  }
  String replaceNumbersToArabic(String input)
  {
    const English=['0','1','2','3','4','5','6','7','8','9'];
    const Arabic=['٠'	,'١','٢', '٣','٤','٥','٦','٧','٨', '٩'];
    for(int i=0;i<English.length;i++)
    {
      input=input.replaceAll(English[i], Arabic[i]);
    }
    return input;
  }
  List<String>times= [];

}