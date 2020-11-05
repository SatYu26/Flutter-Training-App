import 'package:flutter/material.dart';

class ChartContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final String chart;
  ChartContainer({
    @required this.text1,
    @required this.text2,
    @required this.chart,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 10, right: 20, left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      text1,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      text2,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Image.asset(
              chart,
              fit: BoxFit.cover,
              width: 260,
            ),
          ],
        ),
      ),
    );
  }
}
