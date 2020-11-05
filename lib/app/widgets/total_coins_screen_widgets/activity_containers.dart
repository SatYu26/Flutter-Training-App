import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class ActivityContainers extends StatelessWidget {
  final String activityName;
  final String text;
  final double numOfActivity;
  ActivityContainers({
    @required this.activityName,
    @required this.text,
    @required this.numOfActivity,
  });

  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  activityName,
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
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
            Text(
              '$numOfActivity',
              style: TextStyle(
                color: ThemeModel.theme(context)
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
