class NamesAllahMODEL
{
  int? id;
  String? name;
  String? text;
  NamesAllahMODEL({this.id,this.name,this.text});

NamesAllahMODEL.fromJson(Map<String,dynamic>json){
  id=json['id'];
  name=json['name'];
  text=json['text'];
}
}