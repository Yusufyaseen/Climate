import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';
// import 'package:flutter/services.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  String weatherMessage;
  var temperature;
  String weatherIcon;
  String weatherDescription;
  String cityName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = '';
        weatherDescription = 'Nothing';
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather information';
        return;
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var description = weatherData['weather'][0]['description'];
      weatherDescription =
          "Weather is : ${weatherData['weather'][0]['description']}";
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      String message = weatherModel.getMessage(temperature);
      weatherMessage = '${weatherModel.getMessage(temperature)} in $cityName';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.9), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      // SystemChannels.platform
                      //     .invokeMethod('SystemNavigator.pop');
                      var weatherData = await weatherModel.getWeatherData();
                      updateUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var citySearchName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }),
                      );
                      if (citySearchName != null) {
                        var weatherData = await weatherModel
                            .getCityWeatherData(citySearchName);
                        updateUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$temperature°',
                    style: kTempTextStyle,
                  ),
                  Text(
                    '$weatherIcon',
                    style: kConditionTextStyle,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                child: Text(
                  "$weatherDescription",
                  textAlign: TextAlign.center,
                  style: kWeatherDescription,
                ),
              ),
              Container(
                margin: EdgeInsets.all(3.0),
                child: Text(
                  "$weatherMessage",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
