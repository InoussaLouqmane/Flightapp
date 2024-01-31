class DataModel{
   String ? nom ;
   String ? code;


   DataModel({this.nom, this.code});

  factory DataModel.fromJson(Map<String, dynamic> json){
    return  DataModel(
      nom: json['name_translations']['en'],
      code: json['code'],
    );
  }

}