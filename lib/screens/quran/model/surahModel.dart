class SurahModel {
  final int code;
  final String status;
  final List<Datum> data;

  SurahModel({
    required this.code,
    required this.status,
    required this.data,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
    code: json["code"],
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

}

class Datum {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final RevelationType revelationType;

  Datum({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    number: json["number"],
    name: json["name"],
    englishName: json["englishName"],
    englishNameTranslation: json["englishNameTranslation"],
    numberOfAyahs: json["numberOfAyahs"],
    revelationType: revelationTypeValues.map[json["revelationType"]]!,
  );

}

enum RevelationType {
  MECCAN,
  MEDINAN
}

final revelationTypeValues = EnumValues({
  "Meccan": RevelationType.MECCAN,
  "Medinan": RevelationType.MEDINAN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
