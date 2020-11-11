import 'package:TSWEarn/app/Bottom_navigation/home.dart';
import 'package:TSWEarn/app/screens/splash_screen/splashes_screens.dart';
import 'package:TSWEarn/app/services/local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartSplash extends StatefulWidget {
  @override
  _StartSplashState createState() => _StartSplashState();
}

class _StartSplashState extends State<StartSplash> {
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final key1 = 'taps';
    final key2 = 'shaked';
    final value = prefs.get(key) ?? 0;
    final value1 = prefs.get(key1) ?? 0;
    final value2 = prefs.get(key2) ?? 0;
    //final value3 = prefs.get('steps') ?? 0;
    if (value != '0' || value1 != '0' || value2 != '0') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    read();
    Future.delayed(
      Duration(seconds: 2),
      () => {
        // Navigator.of(context).push(
        //   CupertinoPageRoute(
        //     builder: (ctx) => SplashScreen(),
        //   ),
        // ),
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SplashScreen()))
      },
    );
    // notificationPlugin.setListenerForLowerVersions(onNotificationInLowerVersions);
    // notificationPlugin.setOnNotificationClick(onNotificationClick);
    // notificationPlugin.showNotificationWithAttachment();
  }

  //  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
  //   print('Notification Received ${receivedNotification.id}');
  // }
  // onNotificationClick(String payload) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFEFEFEF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'TSWEarn',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4D59DE),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FlutterLogo(
              size: 90,
            ),
          ],
        ),
      ),
    );
  }
}
