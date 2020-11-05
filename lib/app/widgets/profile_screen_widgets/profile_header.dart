import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:TSWEarn/app/screens/profile_screen/edidt_screen.dart';
import 'package:TSWEarn/app/screens/profile_screen/settings_screen.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class ProfileHeader extends StatelessWidget {

  final String name;
  final String username;
  ProfileHeader({@required this.name, @required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: ThemeModel.theme(context)
                    ? Colors.white
                    : Theme.of(context).accentColor,
              )),
          child: Image.asset(
            'assets/images/pr1.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '$username',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => EditScreen(),
              ),
            );
          },
          child: Icon(
            Icons.edit,
            color: ThemeModel.theme(context)
                ? Colors.white
                : Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => SettingsScreen(),
              ),
            );
          },
          child: Icon(
            Icons.settings,
            color: ThemeModel.theme(context)
                ? Colors.white
                : Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
