import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tp/Vol.dart';
import 'package:tp/detail_page.dart';
import 'package:tp/widgets/AppLargeText.dart';
import 'package:tp/widgets/MiddleText.dart';

class MyFlightCard extends StatefulWidget {
  MyFlightCard({super.key});

  int price = 386;
  @override
  State<MyFlightCard> createState() => _MyFlightCardState();
}

class _MyFlightCardState extends State<MyFlightCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String destination = "Dakar";
    Vol voyage = Vol();
    initializeDateFormatting('fr_FR');
    DateTime departure_date = DateTime.now();
    DateTime return_date = DateTime.now();
    String date_depart = DateFormat('d MMM', 'fr_FR').format(departure_date);
    String date_retour = DateFormat('d MMM', 'fr_FR').format(return_date);
    int price = 360;

    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3.0,
        child: Container(
          padding: EdgeInsets.only(right: 10),
          //margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: const Color.fromRGBO(156, 39, 176, 0.5)),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 0),
                  width: MediaQuery.of(context).size.width / 3,
                  //margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      "assets/paris.jpeg",
                      fit: BoxFit.cover,
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(children: [
                      SizedBox(
                        height: 6,
                      ),
                      MiddleText(
                        text: destination,
                        size: 25,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      MiddleText(
                        text: "$date_depart - $date_retour",
                        size: 15,
                      ),
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: AppLargeText(
                      text: "\$ ${price.toString()}",
                      size: 25,
                      color: Colors.purple,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyDetailPage(),
                  settings: RouteSettings(
                    arguments: [date_depart, date_retour, destination, price],
                  )));
      },
    );
  }
}
