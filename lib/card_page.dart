import 'package:flutter/material.dart';
import 'package:tp/flight_results.dart';
import 'package:tp/widgets/AppLargeText.dart';

class MyCardPage extends StatefulWidget {
  const MyCardPage({super.key});

  @override
  State<MyCardPage> createState() => _MyCardPageState();
}

class _MyCardPageState extends State<MyCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Découverte"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(30),
                  height: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: AppLargeText(
                    text: "Découvrez des destinations exotiques !",
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
                MyFlightCard(),
              ]),
            ),
          ),
        ));
  }
}
