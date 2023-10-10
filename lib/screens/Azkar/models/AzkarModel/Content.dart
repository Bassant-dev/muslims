class Content {
  Content({
      this.zekr, 
      this.repeat, 
      this.bless,});

  Content.fromJson(dynamic json) {
    zekr = json['zekr'];
    repeat = json['repeat'];
    bless = json['bless'];
  }
  String? zekr;
  num? repeat;
  String? bless;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['zekr'] = zekr;
    map['repeat'] = repeat;
    map['bless'] = bless;
    return map;
  }

}