import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/Screens/authenticate/authenticate.dart';
import 'package:flutter_coffee_app/Screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // return either Home or Authenticate widget
    return Authenticate();
  }
}