import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/battelfield_screen_widgets/din_rewards.dart';
import 'package:TSWEarn/app/widgets/battelfield_screen_widgets/rank.dart';
import 'package:provider/provider.dart';

class JoinChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    final localStates = Provider.of<LocalState>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => localStates.increasTaps(),
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/im2.png',
              fit: BoxFit.cover,
              width: 400,
              height: 350,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.39),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 25, right: 20, left: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '7 din rewards In',
                            style: TextStyle(
                              color: ThemeModel.theme(context)
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              BuildContainer(
                                numOfPeople: 1518,
                                text: 'People Joined',
                              ),
                              BuildContainer(
                                numOfPeople: 30,
                                text: 'Total Days',
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Rewards',
                            style: TextStyle(
                              color: ThemeModel.theme(context)
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Rank(
                            rank: 1,
                            text: 'Samsung smart TV',
                          ),
                          SizedBox(height: 15),
                          Rank(
                            rank: 2,
                            text: 'Nike sneakers',
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF4D59DE),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30),
                                right: Radius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Join Challenge',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 70),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
