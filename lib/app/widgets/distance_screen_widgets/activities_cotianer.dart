import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class ActivitiesContainer extends StatelessWidget {
  final int number;
  final String text;
  ActivitiesContainer({
    @required this.number,
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Container(
      alignment: Alignment.centerLeft,
      width: 100,
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 12),
      decoration: BoxDecoration(
        gradient: ThemeModel.theme(context)
            ? LinearGradient(
                colors: [
                  Color(0xFF464646),
                  Color(0xFF464646),
                ],
              )
            : LinearGradient(
                colors: [
                  Color(0xFF4B8EEA),
                  Color(0xFF7D5CF6).withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: ThemeModel.theme(context)
              ? Colors.white
              : Theme.of(context).accentColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$number',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
