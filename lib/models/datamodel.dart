import 'package:cloud_firestore/cloud_firestore.dart';


class User {
  String? name = "";
  DateTime? dob;
  GeoPoint? mapLocation;
  int? rank;
  Map? homeStuff;
  bool? goodGuy;
  List<String>? companies = [];

  User (
  {this.name,
    this.dob,
    this.mapLocation,
    this.rank,
    this.homeStuff,
    this.goodGuy,
    this.companies});

  User.fromMap(Map<String, dynamic> map)
    : name = map['name'],
      dob = map['dob'],
      mapLocation = map['mapLocation'],
      rank = map['rank'],
      homeStuff = map['homeStuff'],
      goodGuy = map['goodGuy'],
      companies = map['companies'];


}
