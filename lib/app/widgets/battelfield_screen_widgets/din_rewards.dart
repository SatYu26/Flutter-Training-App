import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class BuildContainer extends StatelessWidget {
  final double numOfPeople;
  final String text;

  BuildContainer({this.numOfPeople, this.text});
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$numOfPeople',
              style: TextStyle(
                color: ThemeModel.theme(context)
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                fontSize: 22,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: ThemeModel.theme(context)
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
