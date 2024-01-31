class FlightModel {
  DateTime? depart_date;
  DateTime? return_date;
  String? origin;
  String? destination;
  String? gate;


  FlightModel({this.depart_date, this.return_date, this.origin, this.destination, this.gate});

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
      depart_date : DateTime.parse(json['depart_date']),
      return_date : DateTime.parse(json['return_date']) ,
      origin: json['origin'],
      destination: json['destination'],
      gate: json['gate']
    );
  }
}
