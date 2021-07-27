import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 95.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 52.0,
);
const kWeatherDescription = TextStyle(
  fontFamily: 'Spartan MB',
  color: Colors.yellowAccent,
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 95.0,
);
const kTextInputStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 30.0,
  ),
  hintText: 'Enter a city name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none),
);
