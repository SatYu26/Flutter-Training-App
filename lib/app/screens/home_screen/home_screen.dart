import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:TSWEarn/app/providers/pedometer_steps_provider.dart';
import 'package:TSWEarn/app/screens/home_screen/radial_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:TSWEarn/app/screens/home_screen/total_coins_screen.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/home_screen_widgets/scroll_grids_and_lists.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final localStates = Provider.of<LocalState>(context);
    //final steps = Provider.of<PedometerStepsProvider>(context);
    print('builded');
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: ThemeModel.theme(context)
              ? Color(0xFF272727)
              : Theme.of(context).primaryColor,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: -15,
                left: -45,
                child: SvgPicture.asset('assets/svgPics/curve2.svg'),
              ),
              Positioned(
                top: deviceSize.height * 0.14,
                right: -70,
                child: SvgPicture.asset('assets/svgPics/curve1.svg'),
              ),
              Positioned(
                top: deviceSize.height * 0.09,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => TotalCoins(),
                      ),
                    );
                  },
                  child: Text(
                    '${22.56}',
                    style: TextStyle(
                      color: ThemeModel.theme(context)
                          ? Color(0xFF57B894)
                          : Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: deviceSize.height * 0.08,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: deviceSize.height * 0.17,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => TotalCoins(),
                      ),
                    );
                  },
                  child: RadialProgress(
                    totalActivity: localStates.taps + localStates.shaked,
                  ),
                ),
              ),
              Column(
                // physics: NeverScrollableScrollPhysics(),
                // addAutomaticKeepAlives: true,
                // shrinkWrap: true,
                children: <Widget>[
                  SizedBox(
                    height: deviceSize.height * 0.45,
                  ),
                  ScrollGridsAndLists(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}