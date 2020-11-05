import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/text_field_container.dart';
import 'package:TSWEarn/app/widgets/profile_screen_widgets/edit_screen_top_row.dart';
import 'package:TSWEarn/app/widgets/profile_screen_widgets/edit_text_fields.dart';

class EditScreen extends StatelessWidget {
  static const routeName = '/edit';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    final Color darkThemeTextColor = Color(0xFFEFEFEF);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: deviceSize.height,
        color: ThemeModel.theme(context) ? Color(0xFF101010) : Color(0xFF4D59DE),
        child: Column(
          children: <Widget>[
            SizedBox(height: deviceSize.height * 0.13),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeModel.theme(context)
                      ? Color(0xFF363636)
                      : Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      EditTopRow(),
                      SizedBox(height: 30),
                      Text(
                        'USERNAME',
                        style: TextStyle(
                          color: ThemeModel.theme(context)
                              ? darkThemeTextColor
                              : Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFieldsContainer(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Username77',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 230,
                        child: Text(
                          'Username is used by your friends to find you.Use letters, numbers, underscore and fullstops',
                          style: TextStyle(
                            color: ThemeModel.theme(context)
                                ? darkThemeTextColor
                                : Colors.grey[600],
                            fontSize: 11,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            EditTextFields(
                              text1: 'WEIGHT',
                              text2: 'HEIGHT',
                              textField1: TextField(
                                decoration: InputDecoration(
                                  hintText: '100Kg',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              textField2: TextField(
                                decoration: InputDecoration(
                                  hintText: '6ft 2in',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(height: 20),
                            EditTextFields(
                              text1: 'DATE IF BIRTH',
                              text2: 'GENDER',
                              textField1: TextField(
                                decoration: InputDecoration(
                                  hintText: '10 Jan, 1989',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              textField2: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Male',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Your date of birth, weight and height are used to calculate the distance you walk and the calories you burn',
                              style: TextStyle(
                                color: ThemeModel.theme(context)
                                    ? darkThemeTextColor
                                    : Colors.grey[600],
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
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
                          'Save Changes',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
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
