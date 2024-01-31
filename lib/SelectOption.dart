import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectOption extends StatefulWidget {
  SelectOption({super.key});
  
  
  @override
  State<SelectOption> createState() => _SelectOptionState();
}

class _SelectOptionState extends State<SelectOption> {
  List l = ['Economique', 'Premium', 'Business'];
  int? itemSelectionne;

  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Passagers et classe"),
      ),
      body: Center(
        child: Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Container(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Passager",
                      style: TextStyle(
                          color: Color.fromRGBO(42, 21, 232, 1),
                          fontSize: 16.0),
                    ),
                  ),
                  Container(
                      decoration: (BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(42, 21, 232, 1))))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Text(
                                  "Adultes",
                                  textScaleFactor: 1.0,
                                ),
                                Text(
                                  ">12 ans",
                                  style: TextStyle(color: Colors.grey),
                                  textScaleFactor: 0.6,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                iconSize: 15.0,
                                onPressed: () {
                                  setState(() {
                                    if (counter > 2) counter--;
                                  });
                                },
                                icon: Icon(
                                  Icons.minimize,
                                  color: Color.fromRGBO(42, 21, 232, 1),
                                ),
                              ),
                              Text(
                                counter.toString(),
                                textScaleFactor: 1.0,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    counter++;
                                  });
                                },
                                icon: Icon(Icons.add),
                                style: ButtonStyle(
                                    surfaceTintColor:
                                        MaterialStateProperty.all(Colors.grey),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey)),
                              ),
                            ],
                          )
                        ],
                      )),
                  Container(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Classe",
                      style: TextStyle(
                          color: Color.fromRGBO(42, 21, 232, 1),
                          fontSize: 16.0),
                    ),
                  ),
                  Container(
                      child: Column(
                    children: [
                      Row(children: [
                        Radio(
                            value: 1,
                            groupValue: itemSelectionne,
                            onChanged: (i) {
                              setState(() {
                                itemSelectionne = i;
                              });
                            }),
                        Text(l[0]),
                      ]),
                      Row(children: [
                        Radio(
                            value: 2,
                            groupValue: itemSelectionne,
                            onChanged: (i) {
                              setState(() {
                                itemSelectionne = i;
                              });
                            }),
                        Text(l[1]),
                      ]),
                      Row(children: [
                        Radio(
                            value: 3,
                            groupValue: itemSelectionne,
                            onChanged: (i) {
                              setState(() {
                                itemSelectionne = i;
                              });
                            }),
                        Text(l[2]),
                      ]),
                    ],
                  )),
                  Container(
                    height: 10.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        
                        Navigator.pop(context, [itemSelectionne, counter]);
                      },
                      child: Text("Continuer"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(42, 21, 232, 1)),
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
