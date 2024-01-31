import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:tp/services/airportdata.dart';
import 'app_cubit_states.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.data, required this.flightData})
      : super(InitialState()) {
    emit(WelcomeState());
    getAirport();
  }
  final DataServices data;
  final DataServices flightData;
  late final places;
  late final flights;

  void getAirport() async {
    try {
      places = await data.getAirportInfos();
      emit(loadedState(this.places));
    } catch (e) {
      print(e);
    }
  }

  void getFlight(String? destination, String? origin, String currency,
      String departureDate) async {
    try {
      emit(searchingFlight());
      flights = await flightData.getFlightList(
          destination, origin, currency, departureDate);
      emit(foundedFlight(flights));
    } catch (e) {
      print(e);
    }
  }

  void getBackAccueil() {
    try {
      emit(returnAccueil());
    } catch (e) {
      print(e);
    }
  }

  void buyTicket() {
    try {
      
      Future.delayed(Duration(seconds: 5), () {
        emit(reserverTicket());
      });
      Future.delayed(Duration(seconds: 5), () {
        emit(pageCheckout());
      });
      emit(returnAccueil());
    } catch (e) {
      print(e);
    }
  }
}
