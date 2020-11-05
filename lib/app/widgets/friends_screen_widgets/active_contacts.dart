import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class ActiveContacts extends StatelessWidget {
  final String id;
  final String image;
  final int totalSteps;

  ActiveContacts({
    @required this.id,
    @required this.image,
    @required this.totalSteps,
  });
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: ThemeModel.theme(context) ? Color(0xFF505050) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: 90,
            ),
            Text(
              'Name',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              'Total Steps',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '$totalSteps',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
