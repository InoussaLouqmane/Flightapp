import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp/SelectOption.dart';
import 'package:tp/Vol.dart';
import 'package:tp/cubit/app_cubit.dart';
import 'package:tp/cubit/app_cubit_states.dart';

class MyAccueil extends StatefulWidget {
  const MyAccueil({super.key});

  @override
  State<MyAccueil> createState() => _MyAccueilState();
}

class _MyAccueilState extends State<MyAccueil> {
  Vol? voyage;
  int _selectedIndex = 0;
  int tabBarIndex = 1;
  Color myColorBlue = Color.fromRGBO(42, 21, 232, 1);
  String departureDate = "Date de départ";
  String ReturnDate = "Date de retour";

  void _onTapItem(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    voyage = Vol(null, null, null, null, null, null, null, null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color tabBarTextColor = Colors.black;

    final TextEditingController DepartureController = TextEditingController();
    final TextEditingController DestinationController = TextEditingController();
    double xHeight = MediaQuery.of(context).size.height;
    double xWidth = MediaQuery.of(context).size.width;

    List<DropdownMenuEntry> dropElements = [
      DropdownMenuEntry(value: "COO", label: "Cotonou"),
      DropdownMenuEntry(value: "PAR", label: "Paris"),
    ];

    String nbrePersonne = "1 personne, Economique";
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(42, 21, 232, 1),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
          ],
          centerTitle: true,
          title: Text("TravelGO"),
          leading: Builder(builder: (context) {
            return IconButton(
                icon: Icon(Icons.grid_view),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          })),
      drawer: Drawer(child: Icon(Icons.grid_3x3)),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            //height: xHeight / 10,
            padding: EdgeInsets.all(0.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  color: myColorBlue,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.airplane_ticket,
                          color: Colors.white,
                        ),
                        Container(
                          width: 7.0,
                        ),
                        Text(
                          "Réservez votre ticket !",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 20.0),
                        )
                      ]),
                ),
                Container(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  height: xHeight / 15,
                  width: xWidth / 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (tabBarIndex == 1) {
                              tabBarIndex = 0;
                            }
                            //print(tabBarIndex);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: ((tabBarIndex == 1)
                                ? Colors.white
                                : myColorBlue),
                          ),
                          alignment: Alignment.center,
                          width: xWidth / 3,
                          child: Text(
                            "Aller Simple",
                            style: TextStyle(
                                color: (tabBarIndex == 1)
                                    ? tabBarTextColor
                                    : Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (tabBarIndex == 0) {
                              tabBarIndex = 1;
                              ReturnDate = "Date de retour";
                            }
                            //print(tabBarIndex);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: ((tabBarIndex == 0)
                                ? Colors.white
                                : myColorBlue),
                          ),
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          width: xWidth / 3,
                          child: Text("Aller Retour",
                              style: TextStyle(
                                  color: (tabBarIndex == 0)
                                      ? tabBarTextColor
                                      : Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 10.0,
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                        height: 10.0,
                      ),
                      DropdownMenu(
                        requestFocusOnTap: true,
                        enableFilter: true,
                        enableSearch: true,
                        width: xWidth / 1.5,
                        label: Text("D'où partez-vous ?"),
                        controller: DepartureController,
                        menuHeight: xHeight / 4,
                        //menuStyle: MenuStyle(),
                        dropdownMenuEntries: dropElements,
                        onSelected: (value) {},
                      ),
                      Container(
                        height: 10.0,
                      ),
                      DropdownMenu(
                        requestFocusOnTap: true,
                        enableFilter: true,
                        enableSearch: true,
                        width: xWidth / 1.5,
                        label: Text("Où allez-vous ?"),
                        controller: DestinationController,
                        menuHeight: xHeight / 4,
                        //menuStyle: MenuStyle(),
                        dropdownMenuEntries: dropElements,
                        onSelected: (value) {},
                      ),
                      Container(
                        height: 10.0,
                      ),
                      //DatePickerExample(),
                      InkWell(
                        onTap: () => showCalendar(0),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          height: xHeight / 11,
                          width: xWidth / 1.5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  departureDate,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.6),
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                )
                              ]),
                        ),
                      ),
                      Container(
                        height: 10.0,
                      ),
                      if (tabBarIndex == 1)
                        InkWell(
                          onTap: () {
                            showCalendar(1);
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            height: xHeight / 11,
                            width: xWidth / 1.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ReturnDate,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.6),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.calendar_month,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  )
                                ]),
                          ),
                        ),
                      Container(
                        height: 15.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectOption()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          height: xHeight / 11,
                          width: xWidth / 1.5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  nbrePersonne,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.6),
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.person,
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                )
                              ]),
                        ),
                      ),
                      Container(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Rechercher un vol"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(myColorBlue)),
                      )
                    ],
                  ),
                  key: UniqueKey(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          backgroundColor: Color.fromRGBO(42, 21, 232, 1),
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onTapItem,
          items: [
            BottomNavigationBarItem(
                label: 'Accueil',
                icon: Icon(
                    (_selectedIndex == 0) ? Icons.home : Icons.home_outlined),
                backgroundColor: Color.fromRGBO(42, 21, 232, 1)),
            BottomNavigationBarItem(
                label: 'Notifs',
                icon: Icon((_selectedIndex == 1)
                    ? Icons.notifications
                    : Icons.notifications_none),
                backgroundColor: Color.fromRGBO(42, 21, 232, 1)),
            BottomNavigationBarItem(
                label: 'Favoris',
                icon: Icon((_selectedIndex == 2)
                    ? Icons.favorite
                    : Icons.favorite_outline),
                backgroundColor: Color.fromRGBO(42, 21, 232, 1)),
            BottomNavigationBarItem(
                label: 'Profil',
                icon: Icon((_selectedIndex == 3)
                    ? Icons.person
                    : Icons.person_outline),
                backgroundColor: Color.fromRGBO(42, 21, 232, 1)),
          ]),
      resizeToAvoidBottomInset: false,
    );
  }

  Future<Null> showCalendar(int key) async {
    DateTime? choix = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2026));

    if (choix != null) {
      var difference = choix.difference(DateTime.now());
      var nbrejour = difference.inDays;
      var day = choix.day;
      var month = choix.month;

      print(nbrejour);

      setState(() {
        if (key == 1) {
          ReturnDate = "${day.toString()}/${month.toString()}";
        } else {
          departureDate = "${day.toString()}/${month.toString()}";
        }
      });
    }
  }

  // BlocBuilder<AppCubit, CubitStates> remplirDropElements() {
  //   return BlocBuilder<AppCubit, CubitStates>(
  //     builder: (context, State) {
  //       List<DropdownMenuEntry> dropElement = [];
  //       if (State is loadedState) {
  //         var infos = State.places;
  //         print(State.places);
  //       }
  //       return Container();
  //     },
  //   );
}
