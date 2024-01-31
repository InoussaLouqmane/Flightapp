import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp/accueil.dart';
import 'package:tp/cubit/app_cubit.dart';
import 'package:tp/main.dart';
import 'package:tp/page_checked.dart';
import 'package:tp/services/airportdata.dart';

class ChargingToBuy extends StatefulWidget {
  const ChargingToBuy({super.key});

  @override
  State<ChargingToBuy> createState() => _ChargingToBuyState();
}

class _ChargingToBuyState extends State<ChargingToBuy>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    //BlocProvider.of<AppCubit>(context).getBackAccueil();
     Future.delayed(Duration(seconds: 5), () {
       Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (_) => const MyBoughtPage()));
     });
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
            //Image.asset('assets/splash.png'),

            Text(
              "Checking places",
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            Container(
              height: 10,
            ),
            CircularProgressIndicator(),
          ],
        ),
      )),
    );
  }
}
