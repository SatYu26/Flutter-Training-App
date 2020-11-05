import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/build_button.dart';

class Splash1Screen extends StatelessWidget {
  final Function gotToSplash2, gotGetSartedScreen;

  Splash1Screen({this.gotToSplash2, this.gotGetSartedScreen});
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
            top: 125,
            child: Image.asset(
              'assets/images/Splash.png',
              width: deviceSize.width * 0.65,
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            child: Text(
              'Walk and \nEarn Coins',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF57B894),
              ),
            ),
          ),
          Positioned(
            top: 200,
            right: 10,
            child: Text(
              '2000 steps \n    2.5 coins',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF57B894),
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            left: deviceSize.width * 0.2,
            child: Text(
              'The more you walk the more \ncoins you collect',
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
              onTap: gotToSplash2,
              child: BuildButton(
                width: 130,
                color: Color(0xFF4D59DE),
                text: 'Next',
                textColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 12,
            child: InkWell(
              onTap: gotGetSartedScreen,
              child: BuildButton(
                width: 120,
                color: Colors.white,
                text: 'Skip',
                textColor: Color(0xFF4D59DE),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
