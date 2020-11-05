import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class ChallengesLits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/im1.png',
                fit: BoxFit.cover,
                width: 250,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      'Nutrition month challenge',
                      style: TextStyle(
                        color: ThemeModel.theme(context)
                            ? Colors.white
                            : Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '10days remaining',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
