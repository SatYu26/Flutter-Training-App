import 'package:TSWEarn/app/providers/pedometer_steps_provider.dart';
import 'package:TSWEarn/app/screens/auth_screen/login_2_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/profile_screen_widgets/settings_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreen createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  static const routeName = '/settings';
  bool _isLoggedIn = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final facebookLogin = FacebookLogin();

  _save(String token, int taps, int shaked) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = token;
    prefs.setString(key, value);
    prefs.setInt('taps', taps);
    prefs.setInt('shaked', shaked);
    //prefs.setString('steps', steps);
  }

  _logout() async {
    await _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Future<Null> _signOut(BuildContext context) async {
    await facebookSignIn.logOut();
    await setState(() {
      _isLoggedIn = false;
    });
    // await facebookLogin.logOut();
    // await _googleSignIn.signOut();
    // await FirebaseAuth.instance.signOut();
  }

  _logoutFB() {
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    //final steps = Provider.of<PedometerStepsProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: deviceSize.height,
        color:
            ThemeModel.theme(context) ? Color(0xFF363636) : Color(0xFF4D59DE),
        child: Column(
          children: <Widget>[
            SizedBox(height: deviceSize.height * 0.13),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 20, right: 10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.chevron_left,
                              size: 45,
                              color: ThemeModel.theme(context)
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                          Consumer<AppThemeProvider>(
                            builder: (context, themeState, child) => Switch(
                              onChanged: (newValue) {
                                themeState.toggleTheme();
                              },
                              value: themeState.isDark,
                              activeColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      SettingsContainer(title: 'Account'),
                      SizedBox(height: 15),
                      SettingsContainer(title: 'Privacy Settings'),
                      SizedBox(height: 15),
                      SettingsContainer(title: 'Help'),
                      SizedBox(height: 15),
                      SettingsContainer(title: 'Understand Step Counting'),
                      SizedBox(height: 15),
                      SettingsContainer(title: 'Battery Optimization'),
                      SizedBox(height: 15),
                      SettingsContainer(title: 'Partner With Us'),
                      SizedBox(height: 15),
                      InkWell(
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          _save('0', 0, 0);
                          //steps.disposeSteps();
                          await prefs.clear();
                          //steps.reset();
                          _logout();
                          // _logoutFB();
                          _signOut(context);
                          Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Login2Screen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: SettingsContainer(title: 'Logout'),
                      ),
                      SizedBox(height: 100)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
