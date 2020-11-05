import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  final String text;
  TopRow({this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.chevron_left,
            size: 45,
            color: Colors.white,
          ),
        ),
        Spacer(),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
