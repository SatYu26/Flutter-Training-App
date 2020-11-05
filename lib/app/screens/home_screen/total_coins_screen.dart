import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/top_row.dart';
import 'package:TSWEarn/app/widgets/total_coins_screen_widgets/activities.dart';
import 'package:TSWEarn/app/widgets/total_coins_screen_widgets/activity_containers.dart';

class TotalCoins extends StatelessWidget {
  static const routeName = '/total-coins';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: deviceSize.height,
        color: ThemeModel.theme(context) ? Color(0xFF363636) : Color(0xFF4D59DE),
        child: Column(
          children: <Widget>[
            SizedBox(height: deviceSize.height * 0.1),
            TopRow(
              text: '10 Sept ,2020',
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                '1518',
                                style: TextStyle(
                                  color: ThemeModel.theme(context)
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                  fontSize: 45,
                                ),
                              ),
                              Text(
                                'Tatal Activity',
                                style: TextStyle(
                                  color: ThemeModel.theme(context)
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '${22.56}',
                                style: TextStyle(
                                  color: Color(0xFF57B894),
                                  fontSize: 45,
                                ),
                              ),
                              Text(
                                'Total Coins',
                                style: TextStyle(
                                  color: ThemeModel.theme(context)
                                      ? Color(0xFF57B894)
                                      : Theme.of(context).primaryColor,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      ActivityContainers(
                        activityName: 'Steps',
                        text: '1000 = 1 Coin, needs location',
                        numOfActivity: 1400,
                      ),
                      SizedBox(height: 10),
                      ActivityContainers(
                        activityName: 'Tap',
                        text: '1000 = 1 Coin, needs location',
                        numOfActivity: 98,
                      ),
                      SizedBox(height: 10),
                      ActivityContainers(
                        activityName: 'Shake',
                        text: '1000 = 1 Coin, needs location',
                        numOfActivity: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              Activities(
                                svgImage: 'assets/icons/step.svg',
                                numOfActivity: 69,
                                activityName: 'Steps',
                                startTime: 11,
                                endTime: 12,
                                coins: 2.8,
                              ),
                              SizedBox(height: 10),
                              Activities(
                                svgImage: 'assets/icons/tap.svg',
                                numOfActivity: 25,
                                activityName: 'Taps',
                                startTime: 11,
                                endTime: 12,
                                coins: 0.80,
                              ),
                              SizedBox(height: 10),
                              Activities(
                                svgImage: 'assets/icons/phone.svg',
                                numOfActivity: 12,
                                activityName: 'Shakes',
                                startTime: 11,
                                endTime: 12,
                                coins: 1.08,
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
            )
          ],
        ),
      ),
    );
  }
}
