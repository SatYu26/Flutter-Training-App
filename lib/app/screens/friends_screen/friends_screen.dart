import 'package:flutter/material.dart';
import 'package:TSWEarn/app/screens/friends_screen/activity_Page.dart';
import 'package:TSWEarn/app/screens/friends_screen/over_view_page.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/friends_screen_widgets/search.dart';


class FriendsScreen extends StatefulWidget {

  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  PageController controller = PageController();
  int _selectedIndex = 0;
  List<String> _text = [
    'Overview',
    'Activity',
  ];
  Widget _buildButton(int index, Function goToNext) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        goToNext();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        width: 160,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Colors.white
              : Theme.of(context).primaryColor,
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          _text[index],
          style: TextStyle(
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: ThemeModel.theme(context) ? Color(0xFF363636) : Color(0xFF4D59DE),
        child: Column(
          children: <Widget>[
            SizedBox(height: 70),
            Search(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildButton(0, () {
                    controller.animateToPage(
                      0,
                      duration: Duration(microseconds: 100),
                      curve: Curves.easeIn,
                    );
                  }),
                  _buildButton(1, () {
                    controller.animateToPage(
                      1,
                      duration: Duration(microseconds: 100),
                      curve: Curves.easeIn,
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: PageView(
                  controller: controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    OverViewPage(),
                    ActivityPage(),
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
