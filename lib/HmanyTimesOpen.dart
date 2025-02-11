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
  Color bgColor = Colors.white;

  initState() {
    super.initState();
    showtimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
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
    );
  }

  void showtimes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    howmanytimes = pref.getInt(PREF_COUNT_KEY) ?? 0;
    howmanytimes++;
    if (howmanytimes % 3 == 0) {
      bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length - 1)];
    }
    pref.setInt(PREF_COUNT_KEY, howmanytimes);
    setState(() {});
  }
}
