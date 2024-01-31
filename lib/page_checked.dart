import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp/accueil.dart';
import 'package:tp/cubit/app_cubit.dart';
import 'package:tp/cubit/app_cubit_logics.dart';
import 'package:tp/main.dart';
import 'package:tp/services/airportdata.dart';


class MyBoughtPage extends StatefulWidget {
  const MyBoughtPage({super.key});

  @override
  State<MyBoughtPage> createState() => _MyBoughtPageState();
}

class _MyBoughtPageState extends State<MyBoughtPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    //Future.delayed(Duration(seconds: 2), () {
    //   return
// Navigator.of(context)
// .pushReplacement(MaterialPageRoute(builder: (_) => const MyHome()));
    //});
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.verified,
              color: Colors.green,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Paiement Effectué !",
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            Container(
              height: 10,
            ),
            BlocProvider<AppCubit>(
              create: (context) => AppCubit(
                flightData: DataServices(),
                data: DataServices(),
              ),
              child: Builder(
                builder: (contextT) => ElevatedButton(
                    onPressed: () {
                      // Navigator.of(contextT).pushReplacement(MaterialPageRoute(
                          // builder: (context) =>  MyHome()));
                      //BlocProvider.of<AppCubit>(contextT).getBackAccueil();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      alignment: Alignment.center,
                      child: Text("Revenir à l'accueil"),
                      //color: Colors.purple,
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
