class DataModel{
   String ? nom ;
   String ? city_code;
   bool? praticable;

   DataModel({this.nom, this.city_code, this.praticable});

  factory DataModel.fromJson(Map<String, dynamic> json){
    return  DataModel(
      nom: json['nom'],
      city_code: json['city_code'],
      praticable: json['flightable'] 
    );
  }

}