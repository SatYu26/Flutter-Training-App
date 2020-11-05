// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class LinearChart extends StatelessWidget {
//   List<FlSpot> getSpots() {
//     return [
//       FlSpot(7, 4),
//       FlSpot(7.5, 2.2),
//       FlSpot(9, 1.5),
//       FlSpot(10, 1),
//       FlSpot(11, 2),
//       FlSpot(12, 3),
//       FlSpot(13, 3.6),
//       FlSpot(14, 4),
//       FlSpot(15, 3),
      
//       FlSpot(15, 5),
      
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(),
//       width: 300,
//       height: 130,
//       child: LineChart(
//         LineChartData(
//           borderData: FlBorderData(show: false),
//           lineBarsData: [
//             LineChartBarData(
//               spots: getSpots(),
//               colors: [Theme.of(context).primaryColor],
//               isCurved: true,
//               dotData: FlDotData(
//                 dotSize: 5,
                
//               )
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
