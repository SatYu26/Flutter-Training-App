import 'package:flutter/material.dart';
import 'package:TSWEarn/app/widgets/distance_screen_widgets/activities_cotianer.dart';
import 'package:TSWEarn/app/widgets/distance_screen_widgets/chart_container.dart';
import 'package:TSWEarn/app/widgets/distance_screen_widgets/distance_container.dart';
import 'package:TSWEarn/app/widgets/top_row.dart';

class DistanceScreen extends StatefulWidget {
  @override
  _DistanceScreenState createState() => _DistanceScreenState();
}

class _DistanceScreenState extends State<DistanceScreen> {
  PageController controller = PageController();
  PageController controller2 = PageController();

  int _selectedIndex = 0;
  List<String> _text = [
    'Day',
    'Week',
    'Month',
  ];
  Widget _buildButton(int index, Function goToNext1, Function goToNext2) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        goToNext1();
        goToNext2();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: 100,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Color(0xFFEFEFEF)
              : Theme.of(context).primaryColor,
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          _text[index],
          style: TextStyle(
            color: _selectedIndex == index ? Color(0xFF4D59DE) : Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            SizedBox(height: deviceSize.height * 0.1),
            TopRow(text: 'Fitness Activity'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButton(0, () {
                  controller.animateToPage(
                    0,
                    duration: Duration(microseconds: 100),
                    curve: Curves.easeIn,
                  );
                }, () {
                  controller2.animateToPage(
                    0,
                    duration: Duration(microseconds: 100),
                    curve: Curves.easeIn,
                  );
                }),
                _buildButton(1, () {
                  controller.animateToPage(
                    1,
                    duration: Duration(microseconds: 100),
                    curve: Curves.easeIn,
                  );
                }, () {
                  controller2.animateToPage(
                    1,
                    duration: Duration(microseconds: 100),
                    curve: Curves.easeIn,
                  );
                }),
                _buildButton(2, () {
                  controller.animateToPage(
                    2,
                    duration: Duration(microseconds: 100),
                    curve: Curves.easeIn,
                  );
                }, () {
                  controller2.animateToPage(
                    2,
                    duration: Duration(microseconds: 100),
                    curve: Curves.easeIn,
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ActivitiesContainer(number: 1400, text: 'Steps'),
                          ActivitiesContainer(number: 560, text: 'Distance'),
                          ActivitiesContainer(number: 140, text: 'Calories'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 210,
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller,
                          children: <Widget>[
                            ChartContainer(
                              text1: 'Distance',
                              text2: 'Todat',
                              chart: 'assets/images/ch1.PNG',
                            ),
                            ChartContainer(
                              text1: 'Distance',
                              text2: 'Past 7 days',
                              chart: 'assets/images/ch2.PNG',
                            ),
                            ChartContainer(
                              text1: 'Distance',
                              text2: 'Past Month',
                              chart: 'assets/images/ch3.PNG',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          width: double.infinity,
                          height: 190,
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: PageView(
                            controller: controller2,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  DistanceContainer(
                                    distance: 1.5,
                                    endTime: 11,
                                    startTime: 12,
                                    isIndex1: true,
                                  ),
                                  SizedBox(height: 10),
                                  DistanceContainer(
                                    distance: 0.5,
                                    endTime: 11,
                                    startTime: 12,
                                    isIndex1: true,
                                  ),
                                  SizedBox(height: 10),
                                  DistanceContainer(
                                    distance: 0.23,
                                    endTime: 11,
                                    startTime: 12,
                                    isIndex1: true,
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  DistanceContainer(
                                    distance: 15,
                                    text: 'Saturday',
                                    isIndex1: false,
                                  ),
                                  SizedBox(height: 10),
                                  DistanceContainer(
                                    distance: 9.5,
                                    text: 'Friday',
                                    isIndex1: false,
                                  ),
                                  SizedBox(height: 10),
                                  DistanceContainer(
                                    distance: 23,
                                    text: 'Thursday',
                                    isIndex1: false,
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  DistanceContainer(
                                    distance: 150,
                                    text: 'Week 4',
                                    isIndex1: false,
                                  ),
                                  SizedBox(height: 10),
                                  DistanceContainer(
                                    distance: 50,
                                    text: 'Week 3',
                                    isIndex1: false,
                                  ),
                                  SizedBox(height: 10),
                                  DistanceContainer(
                                    distance: 230,
                                    text: 'Week 2',
                                    isIndex1: false,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50)
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
