import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class hmanyTimesOpen extends StatefulWidget {
  @override
  State<hmanyTimesOpen> createState() => hmanyTimesOpenState();
}

class hmanyTimesOpenState extends State<hmanyTimesOpen> {
  int howmanytimes = 0; //use for show the times you open the app
  String PREF_COUNT_KEY = "count";
  BoxDecoration bgColor = BoxDecoration(color: Colors.white);

  initState() {
    super.initState();
    showtimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgColor,
        child: Center(
          child: Text.rich(
            TextSpan(text: "You Open This app ", children: [
              TextSpan(
                  text: "$howmanytimes",
                  style: const TextStyle(color: Colors.red, fontSize: 35)),
              const TextSpan(text: " times")
            ]),
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void showtimes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    howmanytimes = pref.getInt(PREF_COUNT_KEY) ?? 0;
    //old question practice
    // if (howmanytimes % 3 == 0) {
    //   bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length - 1)];
    // }
    setState(() {
      howmanytimes++;
      if (howmanytimes % 3 == 0 && howmanytimes % 5 == 0) {
        bgColor = const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.blue]));
      } else if (howmanytimes % 3 == 0) {
        bgColor = BoxDecoration(color: Colors.blue);
      } else if (howmanytimes % 5 == 0) {
        bgColor = BoxDecoration(color: Colors.red);
      }
    });
    pref.setInt(PREF_COUNT_KEY, howmanytimes);
  }
}
