import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
    },
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
    ),
  ));
}


