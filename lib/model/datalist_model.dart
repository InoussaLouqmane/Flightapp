class dataFlight {

  dataFlight({this.depart_date, this.return_date, this.origin, this.destination, this.gate});
  DateTime? depart_date;
  DateTime? return_date;
  String? origin;
  String? destination;
  String? gate;

  factory dataFlight.fromJson(Map<String, dynamic> data) {   
    return dataFlight(
      depart_date : DateTime.parse(data['depart_date']),
      return_date : DateTime.parse(data['return_date']) ,
      origin: data['origin'],
      destination: data['destination'],
      gate: data['gate']
    );
  }

}
