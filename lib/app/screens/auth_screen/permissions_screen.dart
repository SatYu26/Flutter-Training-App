import 'package:flutter/material.dart';
import 'package:TSWEarn/app/Bottom_navigation/home.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/build_button.dart';

class PermissionsScreen extends StatelessWidget {
  Widget _buildContainer(String imageAssets, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
          right: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imageAssets,
            fit: BoxFit.cover,
            width: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/curves.png',
            fit: BoxFit.cover,
            width: deviceSize.width,
          ),
          Positioned(
            top: 160,
            child: Text(
              'Access Required',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: 210,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              height: 180,
              width: 280,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: _buildContainer(
                      'assets/images/google.png',
                      'Google Fit',
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: _buildContainer(
                      'assets/images/location.png',
                      'Location',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => Home(),
                  ),
                );
              },
              child: BuildButton(
                width: 190,
                color: Colors.white,
                text: 'Grant Permissions',
                textColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Positioned(
            bottom: 110,
            child: InkWell(
              onTap: () {},
              child: Text(
                'More Information',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
