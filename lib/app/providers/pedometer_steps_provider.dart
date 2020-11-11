import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

import 'levels_provider.dart';

class PedometerStepsProvider with ChangeNotifier {
  String distanceInKm = "0";
  double distanceJog = 0;
  String calories = "0";
  int speed = 0;

  int steps = 0;
  StreamSubscription<int> _subscription;

  double _num;
  double _convert;
  double _kmx;
  double burnedx;

  var geolocator = Geolocator();
  // var options = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

  Future<void> getSpeed() async {
    var speed2;
    speed2 = Geolocator.getPositionStream().listen((position) {
      var speedInMps = position.speed; // this is your speed
      return speedInMps;
    });
    speed2 = num.parse(speed2.toStringAsFixed(2));
    speed = speed2;
  }


  void setUpPedometer() {
    Pedometer pedometer = new Pedometer();
    _subscription = pedometer.stepCountStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void disposeSteps() {
    _subscription.cancel();
    notifyListeners();
  }

  saveStepsIntoSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('steps', steps);
  }

  loadStepsFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    steps = prefs.get('steps');
  }

  void _onData(int stepCountValue) async {
    // print(stepCountValue); //printing number of steps per console

    steps = stepCountValue;
    // saveStepsIntoSharedPrefs();
    print("dsadadasdad ${steps}");



    steps = stepCountValue;
    //saveStepsIntoSharedPrefs();
    notifyListeners();

    var dist = stepCountValue; //we pass the integer to a variable called dist
    double y = (dist + .0); //we convert it to double a form of several

    _num = y; //we pass it to a state to be captured and converted to double
    notifyListeners();

    var long3 = (_num);
    long3 = num.parse(y.toStringAsFixed(2));
    var long4 = (long3 / 10000);

    int decimals = 1;
    int fac = pow(10, decimals);
    double d = long4;
    d = (d * fac).round() / fac;
    print("d: $d");

    getDistanceRun(_num);

    _convert = d;
    print(_convert);
    notifyListeners();
  }

  void reset() {
    int stepCountValue = 0;
    stepCountValue = 0;
    steps = stepCountValue;
    notifyListeners();
  }

  void _onDone() {}

  void _onError(error) {
    print("Flutter Pedometer Error: $error");
  }

  //function to determine the distance run in kilometers using number of steps
  void getDistanceRun(double _numbers) {
    var distance = ((_numbers * 78) / 100000);
    distance = num.parse(distance.toStringAsFixed(2)); //two decimal places
    var distancekmx = distance * 34;
    distancekmx = num.parse(distancekmx.toStringAsFixed(2));
    //print(distance.runtimeType);

    distanceInKm = "$distance";
    //print(_km);

    _kmx = num.parse(distancekmx.toStringAsFixed(2));
    notifyListeners();

  }

  Future<void> getDistanceJog(double _numbers) async {
    // var dist2;
    var distance = ((_numbers * 78) / 100000);
    var distancejog;
    // distance = num.parse(distance.toStringAsFixed(2)); //two decimal places
    //print(distance.runtimeType);

    if (speed > 8) {
      distancejog = num.parse(distance.toStringAsFixed(2));
      return distancejog;
    }

    distanceJog = distancejog;
    //print(_km);

    // _kmx = num.parse(distancekmx.toStringAsFixed(2));
    notifyListeners();

  }

  //function to determine the calories burned in kilometers using number of steps
  void getBurnedRun(int number) async {
    var cal = number * 0.04; //two decimal places
    cal = num.parse(cal.toStringAsFixed(2));
    calories = "$cal";
    //print(_calories);
    await Future.delayed(const Duration(milliseconds: 100), (){});
    notifyListeners();
  }
}