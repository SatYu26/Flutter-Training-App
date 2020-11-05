import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:TSWEarn/app/Bottom_navigation/tab_items.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';


class CupertinoHomeScaffold extends StatelessWidget {
  final TabItems currentTab;
  final ValueChanged<TabItems> onSelectTab;
  final Map<TabItems, WidgetBuilder> widgetBuilders;
  final Map<TabItems, GlobalKey<NavigatorState>> navigatiorKeys;

  const CupertinoHomeScaffold({
    Key key,
    @required this.currentTab,
    @required this.onSelectTab,
    @required this.widgetBuilders,
    @required this.navigatiorKeys,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _buildItem(TabItems.home, context),
          _buildItem(TabItems.friends, context),
          _buildItem(TabItems.shop, context),
          _buildItem(TabItems.battlField, context),
          _buildItem(TabItems.profile, context),
        ],
        onTap: (index) => onSelectTab(TabItems.values[index]),
      ),
      tabBuilder: (context, index) {
        final item = TabItems.values[index];
        return CupertinoTabView(
          navigatorKey: navigatiorKeys[item],
          builder: (context) => widgetBuilders[item](context),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItems tabItem, BuildContext context) {
    final itemData = TabItemsData.allTabs[tabItem];
    final color = currentTab == tabItem
        ? Color(0xFF4D59DE)
        : Color(0xFF4D59DE).withOpacity(0.7);
    final darkTheme = currentTab == tabItem ? Colors.white : Colors.grey;
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        itemData.svgIcon,
        width: 28,
        color: ThemeModel.theme(context) ? darkTheme : color,
      ),
      title: Text(
        itemData.title,
        style: TextStyle(
          fontSize: 12,
          color: ThemeModel.theme(context) ? darkTheme : color,
        ),
      ),
    );
  }
}
