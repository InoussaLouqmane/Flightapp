import 'package:flutter/material.dart';
import 'package:tp/detail_page.dart';

class MyArchiveSearch extends StatelessWidget {
  MyArchiveSearch({super.key});

  @override
  String lieu_depart = "Cotonou";
  String lieu_arrivee = "Dakar";
  int nombrePersonne = 1;
  String date_depart = "21 Avril.";

  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(bottom: 3.0),
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: (BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.blue)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 8,
              child: Image.asset("assets/paris.jpeg"),
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      lieu_depart,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(width: 10.0),
                    Icon(Icons.arrow_right),
                    SizedBox(width: 10.0),
                    Text(
                      lieu_arrivee,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      date_depart,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black),
                    ),
                    SizedBox(width: 50),
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text(
                      nombrePersonne.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        
      ),
      onTap: (){
       Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyDetailPage(),
                settings: RouteSettings(
                  arguments: [date_depart, date_depart, lieu_arrivee, 380],
                )));
      },
    );
  }
}
