import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/build_button.dart';

class Splash4Screen extends StatelessWidget {
  final Function gotToGetStartedScreen;
  Splash4Screen({this.gotToGetStartedScreen});
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF4D59DE),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/svgPics/sp_curve.svg',
            fit: BoxFit.cover,
            width: deviceSize.width,
          ),
          Positioned(
            top: deviceSize.width * 0.4,
            child: Image.asset(
              'assets/images/Splash3.png',
              fit: BoxFit.cover,
              width: deviceSize.width * 0.7,
              
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Text(
              'Redeem\nCoins & Shop',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF57B894),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: deviceSize.width * 0.1,
            child: Text(
              'Redeem coins to shop. Buy any product. \nGet a chance to win iPhone 11',
              style: TextStyle(
                fontSize: 17,
                color: Color(0xFF4D59DE),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 12,
            child: InkWell(
              onTap: gotToGetStartedScreen,
              child: BuildButton(
                width: 130,
                color: Color(0xFF4D59DE),
                text: 'Next',
                textColor: Colors.white,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
