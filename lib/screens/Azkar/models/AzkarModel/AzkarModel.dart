import 'Content.dart';

class AzkarModel {
  AzkarModel({
      this.title, 
      this.content,});

  AzkarModel.fromJson(dynamic json) {
    title = json['title'];
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(Content.fromJson(v));
      });
    }
  }
  String? title;
  List<Content>? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    if (content != null) {
      map['content'] = content?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}