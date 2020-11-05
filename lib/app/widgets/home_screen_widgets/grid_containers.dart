import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class GridContainers extends StatelessWidget {
  final String svgImage;
  final String number;
  final String text;

  GridContainers({
    @required this.svgImage,
    @required this.number,
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: ThemeModel.theme(context)
            ? LinearGradient(
                colors: [
                  Color(0xFF464646),
                  Color(0xFF464646),
                ],
              )
            : LinearGradient(
                colors: [
                  Color(0xFF4B8EEA),
                  Color(0xFF7D5CF6).withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: ThemeModel.theme(context)
              ? Colors.white
              : Theme.of(context).accentColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgImage,
            width: 25,
            color: Colors.white,
          ),
          Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
