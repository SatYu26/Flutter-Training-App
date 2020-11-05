import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class Levels extends StatelessWidget {
  final String level;
  final String text;
  final Function onPressed;
  final Function onInvitePressed;
  final bool isLevels;
  Levels({
    @required this.level,
    @required this.text,
    this.onPressed,
    this.onInvitePressed,
    this.isLevels = false,
  });
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ThemeModel.theme(context) ? Color(0xFF505050) : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                level,
                style: TextStyle(
                  color: ThemeModel.theme(context)
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: 25,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: ThemeModel.theme(context)
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: 11,
                ),
              ),
              if (!isLevels) SizedBox(height: 10),
              if (!isLevels)
                InkWell(
                  onTap: onInvitePressed,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Color(0xFF4D59DE),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30),
                        right: Radius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Invite & Earn',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (isLevels)
            IconButton(
              icon: Icon(
                Icons.chevron_right,
                color: ThemeModel.theme(context)
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                size: 40,
              ),
              onPressed: onPressed,
            ),
        ],
      ),
    );
  }
}
