import 'package:flutter/cupertino.dart';

class LevelProvider with ChangeNotifier {
  int _level = 1;
  int lastLevelUpSteps=20;

  int get level => _level;


  void setLevel(int step) {


    int getLimit = _level*lastLevelUpSteps;
    print("sdadad1 ${getLimit}");
    print("sdadad5 ${lastLevelUpSteps}");
    if(step>=getLimit)
      {
       _level = 1+_level;
       notifyListeners();
      // lastLevelUpSteps=lastLevelUpSteps*_level;

       print("sdadad2 ${_level}");
       print("sdadad3 ${lastLevelUpSteps}");
      }


    notifyListeners();
  }

}