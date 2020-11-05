import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:TSWEarn/app/screens/battlefield_screen/join_challenge_screen.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class PublicChallenge extends StatelessWidget {
  Widget _buildButton(String text, Color color, Color texrColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Color(0xFF4D59DE),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: texrColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: 280,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/im2.png',
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                child: Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: ThemeModel.theme(context)
                        ? Color(0xFF545454)
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildButton(
                        'Share',
                        Colors.white,
                        Color(0xFF4D59DE),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => JoinChallenge(),
                            ),
                          );
                        },
                        child: _buildButton(
                          'Join',
                          Color(0xFF4D59DE),
                          Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
