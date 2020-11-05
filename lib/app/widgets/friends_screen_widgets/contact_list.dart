import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class ContactList extends StatelessWidget {
  final String id;
  final String name;
  final String image;

  ContactList({
    @required this.id,
    @required this.name,
    @required this.image,
  });
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Color(0xFF4D59DE),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 140,
              width: 120,
              decoration: BoxDecoration(
                color: ThemeModel.theme(context)
                    ? Color(0xFF505050)
                    : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    name,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Invite',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
