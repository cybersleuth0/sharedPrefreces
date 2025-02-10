import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => homepageState();
}

class homepageState extends State<homepage> {
  TextEditingController nameControler = TextEditingController();

  String? nameFromPreferece;

  @override
  Widget build(BuildContext context) {
    //get the value from preference
    getvalueFromPrefs();
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPrefrences"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          nameFromPreferece != null
              ? Text("Welcome $nameFromPreferece")
              : Text("Welcome"),
          SizedBox(height: 20),
          TextField(
            controller: nameControler,
            decoration: InputDecoration(label: Text("Enter Your Name")),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences prefrence =
                    await SharedPreferences.getInstance();
                prefrence.setString("name", nameControler.text.toString());
              },
              child: Text("Submit"))
        ],
      ),
    );
  }

  void getvalueFromPrefs() async {
    SharedPreferences prefrence = await SharedPreferences.getInstance();
    nameFromPreferece = prefrence.getString("name");
    setState(() {});
  }
}
