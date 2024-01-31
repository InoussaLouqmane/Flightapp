import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tp/SelectOption.dart';
import 'package:tp/Vol.dart';
import 'package:tp/accueil.dart';
import 'package:tp/cubit/app_cubit.dart';
import 'package:tp/page_ticket_buy.dart';
import 'package:tp/services/airportdata.dart';
import 'package:tp/widgets/AppLargeText.dart';
import 'package:tp/widgets/MiddleText.dart';
import 'package:intl/intl_standalone.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tp/widgets/custom_button.dart';

class MyDetailPage extends StatefulWidget {
  bool favorite;
  MyDetailPage({
    super.key,
    this.favorite = false,
  });
  bool get isFavorite => favorite;

  @override
  State<MyDetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  Vol card = Vol();
  Intl dateTrans = Intl();

  @override
  void initState() {
    card = Vol();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tableau = ModalRoute.of(context)!.settings.arguments as List;
    initializeDateFormatting('fr_FR');
    String? destination = tableau[2];
    int price = tableau[3];
    String? location = "Benin";
    String date_depart = tableau[0];
    int? nombrePersonne = 1;
    String? classe = "Eco";

    return BlocProvider<AppCubit>(
        create: (context) => AppCubit(
              flightData: DataServices(),
              data: DataServices(),
            ),
        child: Builder(
            builder: ((context) => Scaffold(
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
                                      image: AssetImage("assets/paris.jpeg"),
                                      fit: BoxFit.cover)),
                            )),
                        Positioned(
                            top: 40,
                            left: 15,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
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
                            padding:
                                EdgeInsets.only(top: 30, left: 25, right: 25),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 270,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppLargeText(text: destination!),
                                    MiddleText(
                                      text: "\$" + price.toString(),
                                      color: Colors.purple,
                                      isBold: true,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    MiddleText(
                                        text: location!,
                                        color: Colors.purple,
                                        size: 16),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MiddleText(
                                      text: "Date de départ :",
                                      color: Colors.black,
                                      size: 20,
                                      isBold: true,
                                    ),
                                    MiddleText(
                                      text: date_depart,
                                      color: Colors.black,
                                      size: 15,
                                      isBold: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MiddleText(
                                      text: "Date de retour :",
                                      color: Colors.black,
                                      size: 20,
                                      isBold: true,
                                    ),
                                    MiddleText(
                                      text: date_depart,
                                      color: Colors.black,
                                      size: 15,
                                      isBold: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MiddleText(
                                        text: "Détails :",
                                        color: Colors.black,
                                        size: 20,
                                        isBold: true,
                                      ),
                                      Row(
                                        children: [
                                          MiddleText(
                                            text: nombrePersonne.toString(),
                                            size: 15,
                                          ),
                                          Icon(Icons.person),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          MiddleText(
                                            text: classe!,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(0),
                                            margin: EdgeInsets.all(0),
                                            height: 25,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.red,
                                              child: IconButton(
                                                  padding: EdgeInsets.zero,
                                                  style: ButtonStyle(
                                                      iconColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .white)),
                                                  onPressed: () async {
                                                    var element = await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                SelectOption()));
                                                    setState(() {
                                                      if (element[0] == 1)
                                                        classe = "Eco";
                                                      if (element[0] == 2)
                                                        classe = "Prem";
                                                      if (element[0] == 3)
                                                        classe = "Business";

                                                      nombrePersonne =
                                                          element[1];
                                                    });
                                                  },
                                                  icon: Icon(
                                                    size: 15,
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.favorite = !(widget.favorite);
                                          ScaffoldMessenger.of(context)
                                              .removeCurrentSnackBar();
                                          if (widget.favorite == true) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  margin: EdgeInsets.only(
                                                      right: 10,
                                                      left: 10,
                                                      bottom: 60),
                                                  padding: EdgeInsets.all(10),
                                                  content: Text(
                                                      "Ajouté aux favoris")),
                                            );
                                          }
                                          if (widget.favorite == false) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  margin: EdgeInsets.only(
                                                      right: 10,
                                                      left: 10,
                                                      bottom: 60),
                                                  padding: EdgeInsets.all(10),
                                                  content: Text(
                                                      "Retiré des favoris")),
                                            );
                                          }
                                        });
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                16,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.purple),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Icon(
                                          (widget.favorite == false)
                                              ? Icons.favorite_border
                                              : Icons.favorite_rounded,
                                          color: (widget.favorite == false)
                                              ? Colors.purple
                                              : Colors.red,
                                        ),
                                      ),
                                    ),
                                    
                                    InkWell(
                                      onTap: () {
                                        // BlocProvider.of<AppCubit>(context)
                                        // .buyTicket();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChargingToBuy()));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                16,
                                        decoration: BoxDecoration(
                                          color: Colors.purple,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MiddleText(
                                                text: "Continuer",
                                                color: Colors.white,
                                                isBold: true,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                              ),
                                            ]),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
