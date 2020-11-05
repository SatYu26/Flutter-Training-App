import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/top_row.dart';

class InviteAndEarnScreen extends StatelessWidget {
  static const routeName = '/invite&ear';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: deviceSize.height,
        color:
            ThemeModel.theme(context) ? Color(0xFF363636) : Color(0xFF4D59DE),
        child: Column(
          children: <Widget>[
            SizedBox(height: deviceSize.height * 0.07),
            TopRow(text: 'Invite and Earn'),
            SizedBox(height: deviceSize.height * 0.11),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset('assets/icons/dollar.svg', width: 20),
                Text(
                  '10',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 110,
                  ),
                ),
              ],
            ),
            SizedBox(height: deviceSize.height * 0.06),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Text(
                    'Invite Code',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Namekvnm',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Invite a friend and get 5+5 TSW Coins',
                      style: TextStyle(
                        color: ThemeModel.theme(context)
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem',
                      style: TextStyle(
                        color: ThemeModel.theme(context)
                            ? Colors.grey
                            : Theme.of(context).primaryColor,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF4D59DE),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Invite and Earn',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
