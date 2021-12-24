import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_coffee_app/models/coffee.dart';

class CoffeeList extends StatefulWidget {
  CoffeeList({Key? key}) : super(key: key);

  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {

    final coffees = Provider.of<List<Coffee>>(context);
    coffees.forEach((coffee) { 
      print(coffee.name);
      print(coffee.sugars);
      print(coffee.strength);
    });


    return Container();
  }
}