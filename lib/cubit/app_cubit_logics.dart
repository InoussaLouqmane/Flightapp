import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp/Subpages/offers.dart';
import 'package:tp/accueil.dart';
import 'package:tp/cubit/app_cubit.dart';
import 'package:tp/cubit/app_cubit_states.dart';
import 'package:tp/main.dart';
import 'package:tp/page_checked.dart';
import 'package:tp/page_ticket_buy.dart';
import 'package:tp/splash_screen.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(builder: ((context,  state) {
        if (state is WelcomeState) {
          return MySplash();
        } else if (state is loadedState) {
          return MyHome();
        } else if (state is searchingFlight) {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.flight),
              Container(
                height: 60.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Patientez-un instant"),
                  Container(
                    height: 30,
                  ),
                  CircularProgressIndicator()
                ],
              )
            ]),
          );
        } else if (state is foundedFlight) {
          return MyOffersPage();
        } else if (state is returnAccueil) {
          return MyHome();
        } else if (state is reserverTicket) {
          return ChargingToBuy();
        }else if (state is pageCheckout) {
          return MyBoughtPage();
        } else {
          return Container();
        }
      })),
    );
  }
}
