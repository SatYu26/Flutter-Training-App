import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:TSWEarn/app/providers/pedometer_steps_provider.dart';
import 'package:TSWEarn/app/screens/home_screen/radial_progress.dart';
import 'package:TSWEarn/app/services/local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:TSWEarn/app/screens/home_screen/total_coins_screen.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/home_screen_widgets/scroll_grids_and_lists.dart';
import 'package:provider/provider.dart';
import 'package:flutter_foreground_plugin/flutter_foreground_plugin.dart';
import 'package:firebase_admob/firebase_admob.dart';

import '../../../ad_manager.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int fabIconNumber = 0;
  Icon fab = Icon(
    Icons.notifications,
  );

  Future<void> _initAdMob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }
  BannerAd _bannerAd;

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.top);
  }


  @override
  void initState() {
    // startForegroundService();
    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
    );

    _loadBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
    print('Notification Received ${receivedNotification.id}');
  }

  onNotificationClick(String payload) {}


  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final localStates = Provider.of<LocalState>(context);
    //final steps = Provider.of<PedometerStepsProvider>(context);
    // allTap();
    print('builded');
    return Scaffold(
      body: GestureDetector(
        onTap: () => localStates.increasTaps(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: ThemeModel.theme(context)
                ? Color(0xFF272727)
                : Theme.of(context).primaryColor,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -15,
                  left: -45,
                  child: SvgPicture.asset('assets/svgPics/curve2.svg'),
                ),
                Positioned(
                  top: deviceSize.height * 0.14,
                  right: -70,
                  child: SvgPicture.asset('assets/svgPics/curve1.svg'),
                ),
                Positioned(
                  top: deviceSize.height * 0.09,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => TotalCoins(),
                        ),
                      );
                    },
                    child: Text(
                      '${22.56}',         //                          HERE
                      style: TextStyle(
                        color: ThemeModel.theme(context)
                            ? Color(0xFF57B894)
                            : Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: deviceSize.height * 0.08,
                  right: 0,
                  child: FloatingActionButton(
                    child: fab,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onPressed: () {
                      setState(()  {
                        if (fabIconNumber == 0) {
                          fab = Icon(
                            Icons.notifications_off,
                          );
                          FlutterForegroundPlugin.stopForegroundService();
                          fabIconNumber = 1;
                        } else {
                          fab = Icon(Icons.notifications_active);
                          startForegroundService();
                          notificationPlugin.setListenerForLowerVersions(
                              onNotificationInLowerVersions);
                          notificationPlugin
                              .setOnNotificationClick(onNotificationClick);
                          notificationPlugin.showNotificationWithAttachment();
                          fabIconNumber = 0;
                        }
                      });
                    },
                  ),
                ),
                Positioned(
                  top: deviceSize.height * 0.17,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => TotalCoins(),
                        ),
                      );
                    },
                    child: RadialProgress(
                      totalActivity: localStates.taps == null
                          ? 0
                          : localStates.taps + localStates.shaked == null
                              ? 0
                              : localStates.shaked,
                    ),
                  ),
                ),
                Column(
                  // physics: NeverScrollableScrollPhysics(),
                  // addAutomaticKeepAlives: true,
                  // shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(
                      height: deviceSize.height * 0.45,
                    ),
                    ScrollGridsAndLists(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void startForegroundService() async {
  await FlutterForegroundPlugin.setServiceMethodInterval(seconds: 5);
  await FlutterForegroundPlugin.setServiceMethod(globalForegroundService);
  await FlutterForegroundPlugin.startForegroundService(
    holdWakeLock: false,
    onStarted: () {
      print("Foreground on Started");
    },
    onStopped: () {
      print("Foreground on Stopped");
    },
    title: "Flutter Foreground Service",
    content: "This is Content",
    iconName: "ic_stat_hot_tub",
  );
}

void globalForegroundService() {
  debugPrint("current datetime is ${DateTime.now()}");
}

