import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/text_field_container.dart';

class EditTextFields extends StatelessWidget {
  final String text1;
  final String text2;

  final Widget textField1;
  final Widget textField2;

  const EditTextFields({
    @required this.text1,
    @required this.text2,
    @required this.textField1,
    @required this.textField2,
  });

  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text1,
              style: TextStyle(
                color: ThemeModel.theme(context)
                    ? Color(0xFFEFEFEF)
                    : Colors.grey[600],
                fontSize: 15,
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 150,
              height: 45,
              child: TextFieldsContainer(
                child: textField1,
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text2,
              style: TextStyle(
                color: ThemeModel.theme(context)
                    ? Color(0xFFEFEFEF)
                    : Colors.grey[600],
                fontSize: 15,
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 150,
              height: 45,
              child: TextFieldsContainer(
                child: textField2,
              ),
            )
          ],
        ),
      ],
    );
  }
}
