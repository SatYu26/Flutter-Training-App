import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double width;
  BuildButton({this.text, this.color, this.textColor, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(35),
            right: Radius.circular(35),
          ),
          border: Border.all(
            width: 1,
            color: Colors.white,
          )),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 15,
        ),
      ),
    );
  }
}
