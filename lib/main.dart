import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharedpreprences/HmanyTimesOpen.dart';
import 'package:sharedpreprences/home_Page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/howmanytimesOpen",
    routes: {
      "/howmanytimesOpen": (context) => hmanyTimesOpen(),
      "/": (context) => homepage()
    },
  ));
}
