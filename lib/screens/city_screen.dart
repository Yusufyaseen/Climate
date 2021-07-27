import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 40.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  decoration: kTextInputStyle,
                  onChanged: (value) {
                    setState(() {
                      cityName = value;
                    });
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(
                      new FocusNode()); // It hide the soft keyboard
                  Duration sec = Duration(seconds: 1);
                  Future.delayed(sec, () {
                    Navigator.pop(context, cityName);
                  });
                  // To hide the keyboard screen
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
