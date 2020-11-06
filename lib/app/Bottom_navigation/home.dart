import 'package:flutter/material.dart';
import 'package:TSWEarn/app/Bottom_navigation/tab_items.dart';
import 'package:TSWEarn/app/screens/battlefield_screen/battlefield_screen.dart';
import 'package:TSWEarn/app/screens/friends_screen/friends_screen.dart';
import 'package:TSWEarn/app/screens/home_screen/home_screen.dart';
import 'package:TSWEarn/app/screens/profile_screen/profile_screen.dart';
import 'package:TSWEarn/app/screens/shop_screen/shop_screen.dart';

import 'cupertino_home_scaffold.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TabItems _currentTab = TabItems.home;


  final Map<TabItems, GlobalKey<NavigatorState>> navigatiorKeys = {
    TabItems.home: GlobalKey<NavigatorState>(),
    TabItems.friends: GlobalKey<NavigatorState>(),
    TabItems.shop: GlobalKey<NavigatorState>(),
    TabItems.battlField: GlobalKey<NavigatorState>(),
    TabItems.profile: GlobalKey<NavigatorState>(),
  };

  Map<TabItems, WidgetBuilder> get widgetBuilders {
    return {
      TabItems.home: (_) => HomeScreen(),
      TabItems.friends: (_) => FriendsScreen(),
      TabItems.shop: (_) => ShopScreen(),
      TabItems.battlField: (_) => BattlefieldScreen(),
      TabItems.profile: (_) => ProfileScreen(),
    };
  }

  void _select(TabItems tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatiorKeys[_currentTab].currentState.maybePop(),
      child: CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilders: widgetBuilders,
        navigatiorKeys: navigatiorKeys,
      ),
    );
  }
}
