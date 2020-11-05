import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class DistanceContainer extends StatelessWidget {
  final double distance;
  final double startTime;
  final double endTime;
  final String text;
  final bool isIndex1;

  DistanceContainer({
    @required this.distance,
    this.startTime,
    this.endTime,
    this.text,
    this.isIndex1 = true,
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
          child: SvgPicture.asset('assets/icons/loction.svg'),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$distance km',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 3),
              ],
            ),
            if (isIndex1)
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
            if (!isIndex1)
              Text(
                text,
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
    );
  }
}
