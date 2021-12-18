import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/Screens/authenticate/authenticate.dart';
import 'package:flutter_coffee_app/Screens/home/home.dart';
import 'package:flutter_coffee_app/models/newuser.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<NewUser>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}