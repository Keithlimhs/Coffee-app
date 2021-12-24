import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/services/auth.dart';
import 'package:flutter_coffee_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_coffee_app/Screens/home/coffee_list.dart';
import 'package:flutter_coffee_app/models/coffee.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Coffee>?>.value(
      value: DatabaseService(uid: '').brews, 
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Creme Cold Brew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ]
        ),
        body: CoffeeList(),
      ),
    );
  }
}