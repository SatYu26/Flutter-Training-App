import 'package:flutter/cupertino.dart';

enum TabItems {
  home,
  friends,
  shop,
  battlField,
  profile,
}

class TabItemsData {
  final String title;
  final String svgIcon;

  const TabItemsData({
    @required this.title,
    @required this.svgIcon,
  });

  static const Map<TabItems, TabItemsData> allTabs = {
    TabItems.home: TabItemsData(
      title: 'Home',
      svgIcon: 'assets/icons/home-24px.svg',
    ),
    TabItems.friends: TabItemsData(
      title: 'Friends',
      svgIcon: 'assets/icons/people.svg',
    ),
    TabItems.shop: TabItemsData(
      title: 'Shop',
      svgIcon: 'assets/icons/cart.svg',
    ),
    TabItems.battlField: TabItemsData(
      title: 'Battle Field',
      svgIcon: 'assets/icons/chart.svg',
    ),
    TabItems.profile: TabItemsData(
      title: 'Profile',
      svgIcon: 'assets/icons/person.svg',
    ),
  };
}
