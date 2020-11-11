import 'package:TSWEarn/app/providers/levels_provider.dart';
import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:TSWEarn/app/providers/pedometer_steps_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:TSWEarn/app/screens/home_screen/distance_screen.dart';
import 'package:TSWEarn/app/screens/home_screen/invite&earn_screen.dart';
import 'package:TSWEarn/app/screens/home_screen/levels_screen.dart';
import 'package:TSWEarn/app/screens/shop_screen/shop_screen.dart';
import 'package:TSWEarn/app/widgets/home_screen_widgets/grid_containers.dart';
import 'package:TSWEarn/app/widgets/home_screen_widgets/levels.dart';
import 'package:TSWEarn/app/widgets/home_screen_widgets/shake_screen.dart';

class ScrollGridsAndLists extends StatefulWidget {
  @override
  _ScrollGridsAndListsState createState() => _ScrollGridsAndListsState();
}

class _ScrollGridsAndListsState extends State<ScrollGridsAndLists> {
  @override
  void initState() {
    final steps = Provider.of<PedometerStepsProvider>(context, listen: false);
    final localStates = Provider.of<LocalState>(context, listen: false);
    super.initState();
    localStates.shakeHands();
    //steps.startListening();
    steps.setUpPedometer();
    localStates.loadTapsFromSharedPrefs();
    localStates.loadShakedFromSharedPrefs();
    //steps.loadStepsFromSharedPrefs();
  }

  @override
  void dispose() {
    final localStates = Provider.of<LocalState>(context, listen: false);
    localStates.disposeDetector();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localStates = Provider.of<LocalState>(context,listen: true);
    final steps = Provider.of<PedometerStepsProvider>(context,listen: true);

    Provider.of<PedometerStepsProvider>(context,listen: true).addListener(() {
      int newSteps = int.parse(Provider.of<PedometerStepsProvider>(context,listen: false).steps.toString(), radix: 10);
      Provider.of<LevelProvider>(context,listen: false).setLevel(newSteps);
    });

    steps.getBurnedRun(steps.steps);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: CustomScrollView(
        // scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverGrid(
            delegate: SliverChildListDelegate([
              GridContainers(
                svgImage: 'assets/icons/step.svg',
                number: '${steps.steps}',
                text: 'Steps',
              ),
              InkWell(
                onTap: () {
                  localStates.increasTaps();
                },
                child: GridContainers(
                  svgImage: 'assets/icons/tap.svg',
                  number: '${localStates.taps}',
                  text: 'Taps',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => ShakeScreen(),
                    ),
                  );
                },
                child: GridContainers(
                  svgImage: 'assets/icons/phone.svg',
                  number: '${localStates.shaked}',
                  text: 'Shake',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => DistanceScreen(),
                    ),
                  );
                },
                child: GridContainers(
                  svgImage: 'assets/icons/loction.svg',
                  number: '${steps.distanceInKm}',
                  text: 'Distance',
                ),
              ),
              GridContainers(
                svgImage: 'assets/icons/fire.svg',
                number: '${steps.calories}',
                text: 'Calories',
              ),
              GridContainers(
                svgImage: 'assets/icons/run.svg',
                number: '${steps.speed}',
                text: 'Speed',
              ),
              GridContainers(
                svgImage: 'assets/icons/loction.svg',
                number: '${steps.distanceJog}',
                text: 'Travel',
              ),
            ]),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
              childAspectRatio: 0.85,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 90,
            delegate: SliverChildListDelegate([
              Levels(
                level: 'Daily Rewards',
                text: '0/5 Earned',
                isLevels: true,
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => ShopScreen(),
                    ),
                  );
                },
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 90,
            delegate: SliverChildListDelegate([
              Levels(
                level: 'LEVEL 2!',
                text:
                    'Reach 10 points today to upgrade to level 3! \nRedeem more coins to buy more products.',
                isLevels: true,
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => LeveLsScreen(),
                    ),
                  );
                },
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 120,
            delegate: SliverChildListDelegate(
              [
                Levels(
                  level: 'Earn 10 more coins',
                  text: 'Get rewarded for every friend you invite.',
                  isLevels: false,
                  onInvitePressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => InviteAndEarnScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
