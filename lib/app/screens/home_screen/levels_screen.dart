import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/top_row.dart';
import 'package:provider/provider.dart';

class LeveLsScreen extends StatelessWidget {
  static const routeName = '/levels';

  Widget _buildContainer(Widget child) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        width: double.infinity,
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localStates = Provider.of<LocalState>(context);
    final deviceSize = MediaQuery.of(context).size;
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
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
              SizedBox(height: deviceSize.height * 0.1),
              TopRow(
                text: '10 Sept ,2020',
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      _buildContainer(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'LEVEL 2',
                              style: TextStyle(
                                color: ThemeModel.theme(context)
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                                fontSize: 26,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  '2.08\$',
                                  style: TextStyle(
                                    color: Color(0xFF57B894),
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  'Daily limit',
                                  style: TextStyle(
                                    color: ThemeModel.theme(context)
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SvgPicture.asset(
                        'assets/svgPics/Group 87.svg',
                        color: ThemeModel.theme(context)
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                      SizedBox(height: 20),
                      _buildContainer(
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Reached Daily Limit',
                            style: TextStyle(
                              color: ThemeModel.theme(context)
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildContainer(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'To Level Up =',
                              style: TextStyle(
                                color: ThemeModel.theme(context)
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Reach the Daily Limit to upgrade to ',
                                  style: TextStyle(
                                    color: ThemeModel.theme(context)
                                        ? Colors.grey
                                        : Colors.grey[700],
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  'Level 3',
                                  style: TextStyle(
                                      color: ThemeModel.theme(context)
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
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
