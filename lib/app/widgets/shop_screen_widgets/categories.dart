import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ThemeModel.theme(context) ? Color(0xFF464646) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/all.svg',
                  color: ThemeModel.theme(context) ? Colors.grey : null,
                ),
                SizedBox(height: 5),
                Text(
                  'All',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/food.svg',
                  color: ThemeModel.theme(context)
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                ),
                SizedBox(height: 5),
                Text(
                  'Food',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/music.svg',
                  color: ThemeModel.theme(context)
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                ),
                SizedBox(height: 5),
                Text(
                  'Electronics',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/movies.svg',
                  color: ThemeModel.theme(context)
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                ),
                SizedBox(height: 5),
                Text(
                  'Movies',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/tshirt.svg',
                  color: ThemeModel.theme(context)
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                ),
                SizedBox(height: 5),
                Text(
                  'Cloths',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
