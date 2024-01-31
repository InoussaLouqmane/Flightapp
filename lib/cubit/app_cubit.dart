import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:tp/services/airportdata.dart';
import 'app_cubit_states.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
    getAirport();
  }
  final DataServices data;
  late final places;

  void getAirport() async {
    try {
      places = await data.getAirportInfos();
      //emit(loadedState(this.places));
    } catch (e) {
      print(e);
    }
  }
}
