import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tp/accueil.dart';
import 'package:tp/card_page.dart';
import 'package:tp/cubit/app_cubit.dart';
import 'package:tp/cubit/app_cubit_states.dart';
import 'package:tp/flight_results.dart';
import 'package:tp/main.dart';
import 'package:tp/widgets/AppLargeText.dart';
import 'package:tp/widgets/MiddleText.dart';
import 'package:tp/widgets/custom_button.dart';

class MyOffersPage extends StatefulWidget {
  const MyOffersPage({super.key});

  @override
  State<MyOffersPage> createState() => _MyOffersPageState();
}

class _MyOffersPageState extends State<MyOffersPage> {
  var infos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/emirat.jpg"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: 40,
              left: 15,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubit>(context).getBackAccueil();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ],
              )),
          Positioned(
            top: 270,
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 25, right: 25),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 270,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(children: [
                MiddleText(
                    text:
                        "Aucun résultat ne correspond exactement à ce que vous recherchez. \nVeuillez consulter nos offres disponibles pour votre destination"),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyCardPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: AppLargeText(
                      text: "Voir offres!",
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),

                // BlocBuilder<AppCubit, CubitStates>(builder: (context, State) {
                //   if (State is foundedFlight) {
                //     infos = State.flights;
                //     if (infos.length == 0) {
                //       return Center(
                //         child: Container(
                //           width: MediaQuery.of(context).size.width / 1.5,
                //           padding: EdgeInsets.all(30),
                //           child: Column(children: [

                //           ]),
                //         ),
                //       );
                //     }
                //   }
                //   return Expanded(
                //       child: SizedBox(
                //     height: 500,
                //     child: ListView.builder(
                //         itemCount: infos.length,
                //         itemBuilder: (context, i) {
                //           return MyFlightCard();
                //         }),
                //   ));
                // }),
              ]),
            ),
          )
        ],
      ),
    ));
  }
}
