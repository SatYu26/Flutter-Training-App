import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/friends_screen_widgets/all_friends_container.dart';

class ActivityPage extends StatelessWidget {
  Widget _buildButton(
    String text,
    Color bgColor,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: 100,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'All Friends',
          style: TextStyle(
            color: ThemeModel.theme(context)
                ? Colors.white
                : Theme.of(context).primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10),
        AllFriendContainer(
          text: 'Karan Started following you',
          name: '@username',
          image: 'assets/images/person9.png',
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/person9.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Karan Started following you',
                            style: TextStyle(
                              color: ThemeModel.theme(context)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '@username',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '10d',
                        style: TextStyle(
                          color: ThemeModel.theme(context) ? Colors.white : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildButton(
                        'Like',
                        Color(0xFF4D59DE),
                      ),
                      _buildButton(
                        'Challenge',
                        Color(0xFF4D59DE),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        AllFriendContainer(
          text: 'Taylor Started following you',
          name: '@username',
          image: 'assets/images/person10.png',
        ),
      ],
    );
  }
}
