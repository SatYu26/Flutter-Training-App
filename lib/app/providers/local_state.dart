import 'package:flutter/cupertino.dart';
import 'package:shake/shake.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalState with ChangeNotifier {
  String key = 'taps';
  String key2 = 'shaked';
  int taps = 0;
  int shaked = 0;
  ShakeDetector detector;

  void increasTaps() async {
    taps++;
    notifyListeners();
    saveTapsIntoSharedPrefs();
  }

  saveTapsIntoSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, taps);
  }

  loadTapsFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    taps = prefs.get(key);
  }

  void shakeHands() {
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        shaked+=1 ;
        notifyListeners();
        saveShakedIntoSharedPrefs();
      },
    );
    
  }

  void disposeDetector() {
    detector.startListening();
    notifyListeners();
  }

  saveShakedIntoSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key2, shaked);
  }

  loadShakedFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    shaked = prefs.get(key2);
  }
}
