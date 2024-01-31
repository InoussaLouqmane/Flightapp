import 'package:equatable/equatable.dart';
import 'package:tp/model/airport_model.dart';
import 'package:tp/model/flight_model.dart';
import 'package:tp/services/airportdata.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  WelcomeState();
  @override
  List<Object> get props => [];
}

class loadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class loadedState extends CubitStates {
  loadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class loadingAirportInfos extends CubitStates {
  @override
  List<Object> get props => [];
}

class searchingFlight extends CubitStates {
  @override
  List<Object> get props => [];
}

class foundedFlight extends CubitStates {
  foundedFlight(this.flights);
  final List<FlightModel> flights;
  @override
  List<Object> get props => [flights];
}

class returnAccueil extends CubitStates {
  @override
  List<Object> get props => [];
}

class reserverTicket extends CubitStates {
  @override
  List<Object> get props => [];
}

class pageCheckout extends CubitStates {
  @override
  List<Object> get props => [];
}
