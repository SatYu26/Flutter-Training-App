import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/build_button.dart';

class Splash2Screen extends StatelessWidget {
  final Function gotToSplash3, gotGetSartedScreen;

  Splash2Screen({this.gotToSplash3, this.gotGetSartedScreen});
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
            top: deviceSize.height * 0.11,
            child: Image.asset(
              'assets/images/Splash1.png',
              fit: BoxFit.cover,
              width: deviceSize.width * 0.65,
            ),
          ),
          Positioned(
            top: 135,
            child: Divider(
              thickness: 10,
              color: Color(0xFF3C354C),
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Text(
              'Shake your\n Phone',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF57B894),
              ),
            ),
          ),
          Positioned(
            top: 270,
            right: 15,
            child: Text(
              '             Earn coins\n Just wiht a shake',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF57B894),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: deviceSize.width * 0.1,
            child: Text(
              'Tired of walking? \nShake your phone to earn coins.',
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
              onTap: gotToSplash3,
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
