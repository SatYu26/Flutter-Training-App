import 'package:flutter/material.dart';

class TextFieldsContainer extends StatelessWidget {
  final Widget child;
  TextFieldsContainer({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
          right: Radius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
