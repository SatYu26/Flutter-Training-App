import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class Activities extends StatelessWidget {
  final String svgImage;
  final int numOfActivity;
  final String activityName;
  final double startTime;
  final double endTime;
  final double coins;

  Activities({
    @required this.svgImage,
    @required this.numOfActivity,
    @required this.activityName,
    @required this.startTime,
    @required this.endTime,
    @required this.coins,
  });
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF4D59DE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(svgImage),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$numOfActivity',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  activityName,
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '$startTime am',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 12,
                  ),
                ),
                Text(
                  ' to ',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '$endTime pm',
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
        Spacer(),
        Row(
          children: <Widget>[
            Text(
              '+ ',
              style: TextStyle(
                color: ThemeModel.theme(context)
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                fontSize: 15,
              ),
            ),
            Text(
              '$coins',
              style: TextStyle(
                color: Color(0xFF57B894),
                fontSize: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
