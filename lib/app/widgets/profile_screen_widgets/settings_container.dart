import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class SettingsContainer extends StatelessWidget {
  final String title;
  SettingsContainer({@required this.title});
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right,
              size: 35,
              color:
                  ThemeModel.theme(context) ? Colors.black : Color(0xFF4D59DE),
            ),
          ],
        ),
      ),
    );
  }
}
