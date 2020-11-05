import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class FollowerAndFollowing extends StatelessWidget {
  Widget _buildContainer(int number, String text) {
    return Container(
      width: 80,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFF4D59DE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Text(
            '$number',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          //color: Colors.white,
          border: Border.all(
            width: 1,
            color: ThemeModel.theme(context)
                ? Colors.white
                : Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildContainer(1, 'Follower'),
            _buildContainer(2, 'Level'),
            _buildContainer(7, 'Following'),
          ],
        ),
      ),
    );
  }
}
