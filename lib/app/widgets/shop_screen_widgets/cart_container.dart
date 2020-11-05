import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class CartContainer extends StatelessWidget {
  final String title;
  final String text;
  CartContainer({@required this.title, @required this.text});

  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: ThemeModel.theme(context)
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                fontSize: 17,
              ),
            ),
            Spacer(),
            Text(
              text,
              style: TextStyle(
                color: ThemeModel.theme(context)
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 35,
              color:
                  ThemeModel.theme(context) ? Colors.white : Color(0xFF4D59DE),
            ),
          ],
        ),
      ),
    );
  }
}
