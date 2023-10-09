
class SalahTimeModel {
  final int code;
  final String status;
  final Data data;

  SalahTimeModel({
    required this.code,
    required this.status,
    required this.data,
  });



  factory SalahTimeModel.fromJson(Map<String, dynamic> json) => SalahTimeModel(
    code: json["code"],
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  final Timings timings;

  Data({
    required this.timings,
  });



  factory Data.fromJson(Map<String, dynamic> json)
  {
   return Data(
      timings: Timings.fromJson(json["timings"]),
    );
  }


}










class Timings {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;


  Timings({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });



  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
    fajr: json["Fajr"],
    dhuhr: json["Dhuhr"],
    asr: json["Asr"],
    maghrib: json["Maghrib"],
    isha: json["Isha"],
  );

}
