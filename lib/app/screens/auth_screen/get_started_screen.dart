import 'package:flutter/material.dart';
import 'package:TSWEarn/app/screens/auth_screen/create_account_screen.dart';
import 'package:TSWEarn/app/screens/auth_screen/login_2_screen.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/build_button.dart';

class GetStartedScreen extends StatelessWidget {
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
              top: 70,
              child: Text(
                'LOGO',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF57B894),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: -80,
              child: Image.asset(
                'assets/images/get started.png',
                fit: BoxFit.cover,
                width: 500,
              ),
            ),
            Positioned(
              bottom: 150,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => Login2Screen(),
                    ),
                  );
                },
                child: BuildButton(
                  width: 190,
                  text: 'Log in',
                  color: Colors.white,
                  textColor: Color(0xFF4D59DE),
                ),
              ),
            ),
            Positioned(
                bottom: 80,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => CreateAccountScreen(),
                      ),
                    );
                  },
                  child: BuildButton(
                    width: 190,
                    text: 'Create account',
                    color: Color(0xFF4D59DE),
                    textColor: Colors.white,
                  ),
                )),
          ],
        ));
  }
}
