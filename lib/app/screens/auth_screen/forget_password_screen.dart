import 'package:flutter/material.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/build_button.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/text_field_container.dart';


class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: deviceSize.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/curves.png',
                fit: BoxFit.cover,
                width: deviceSize.width,
              ),
              Positioned(
                top: 40,
                left: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 50,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: 150,
                left: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Please enter your email address. You will \nreceive a link to create a new password via email.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 280,
                child: Container(
                  width: deviceSize.width * 0.85,
                  child: TextFieldsContainer(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[400],
                        ),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
              ),
              Positioned(
                width: 190,
                bottom: 170,
                child: InkWell(
                  onTap: () {},
                  child: BuildButton(
                    text: 'Send',
                    color: Colors.white,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
