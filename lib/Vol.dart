import 'package:flutter/material.dart';

class Vol {
  DateTime? date_depart;
  DateTime? date_arrivee;
  DateTime? date_retour;
  int? nbPersonne;
  Classe? classe;
  String? lieu_depart;
  String? lieu_arrivee;
  bool? hotel;

  Vol(this.date_depart, this.date_arrivee, this.date_retour, this.nbPersonne,
      this.classe, this.lieu_depart, this.lieu_arrivee, this.hotel) {}
}

enum Classe { economique, business, premium }
