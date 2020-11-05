import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class EditTopRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.chevron_left,
            color: ThemeModel.theme(context)
                ? Colors.white
                : Theme.of(context).primaryColor,
            size: 50,
          ),
        ),
        Spacer(),
        Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: ThemeModel.theme(context)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                ),
                child: Image.asset(
                  'assets/images/pr1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
        Spacer(),
      ],
    );
  }
}
