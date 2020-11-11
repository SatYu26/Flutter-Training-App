import 'dart:async';

import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/battelfield_screen_widgets/din_rewards.dart';
import 'package:TSWEarn/app/widgets/distance_screen_widgets/chart_container.dart';
import 'package:TSWEarn/app/widgets/profile_screen_widgets/followers_and_following.dart';
import 'package:TSWEarn/app/widgets/profile_screen_widgets/profile_header.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = '';
  String _username = '';

  @override
  void initState() {
    getNameFromSharedPrefs().then(_updateName);
    getNameFromSharedPrefs().then(_updateUsername);
    super.initState();
  }

  Future<String> getNameFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.get('name');
    return _name;
  }

  Future<String> getUsernameFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.get('username');
    return _username;
  }

  void _updateName(String name) {
    setState(() {
      this._name = name;
    });
  }

  void _updateUsername(String username) {
    setState(() {
      this._username = username;
    });
  }

  Widget _buildButton(
      String text, Color color, Color texrColor, Color borderColor) {
    return Container(
      alignment: Alignment.center,
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: texrColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final localStates = Provider.of<LocalState>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => localStates.increasTaps(),
        child: Container(
          width: double.infinity,
          height: deviceSize.height,
          color:
              ThemeModel.theme(context) ? Color(0xFF363636) : Color(0xFF4D59DE),
          child: Column(
            children: <Widget>[
              SizedBox(height: deviceSize.height * 0.13),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15, top: 20, right: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ProfileHeader(
                          name: _name,
                          username: _username,
                        ),
                        SizedBox(height: 20),
                        FollowerAndFollowing(),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BuildContainer(
                              numOfPeople: 1580,
                              text: 'Total Activity',
                            ),
                            BuildContainer(
                              numOfPeople: 22.56,
                              text: 'Total Coins',
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ChartContainer(
                          text1: 'TotalActivity',
                          text2: 'Past 7 days',
                          chart: 'assets/images/ch1.PNG',
                        ),
                        SizedBox(height: 20),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Your Coins',
                                  style: TextStyle(
                                    color: ThemeModel.theme(context)
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '${22.56}',
                                  style: TextStyle(
                                    color: ThemeModel.theme(context)
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                                _buildButton(
                                  'Redeem',
                                  Color(0xFF4D59DE),
                                  Colors.white,
                                  ThemeModel.theme(context)
                                      ? Colors.white
                                      : Color(0xFF4D59DE),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}