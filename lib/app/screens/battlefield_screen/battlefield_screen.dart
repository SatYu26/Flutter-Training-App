import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/battelfield_screen_widgets/challenges_list.dart';
import 'package:TSWEarn/app/widgets/battelfield_screen_widgets/public_challenge.dart';
import 'package:TSWEarn/app/widgets/friends_screen_widgets/rank_container.dart';
import 'package:provider/provider.dart';

class BattlefieldScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    final localStates = Provider.of<LocalState>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => localStates.increasTaps(),
        child: Container(
          width: double.infinity,
          height: deviceSize.height,
          color: ThemeModel.theme(context)? Color(0xFF363636) : Color(0xFF4D59DE),
          child: Column(
            children: <Widget>[
              SizedBox(height: deviceSize.height * 0.13),
              Text(
                'BattleField',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15, top: 20),
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
                        Text(
                          'Starte a Challenge',
                          style: TextStyle(
                            color: ThemeModel.theme(context)? Colors.white : Theme.of(context).primaryColor,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 130,
                          width: double.infinity,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              ChallengesLits(),
                              ChallengesLits(),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Public Challenge',
                          style: TextStyle(
                            color: ThemeModel.theme(context)? Colors.white : Theme.of(context).primaryColor,
                            fontSize: 17,
                          ),
                        ),
                        PublicChallenge(),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'History',
                                style: TextStyle(
                                  color: ThemeModel.theme(context)? Colors.white : Theme.of(context).primaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'View All',
                                style: TextStyle(
                                  color: ThemeModel.theme(context)? Colors.white : Theme.of(context).primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        RankContainer(),
                        SizedBox(height: 10),
                        RankContainer(),
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
