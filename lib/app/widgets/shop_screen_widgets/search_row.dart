import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:TSWEarn/app/screens/shop_screen/cart_screen.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class SearchRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            width: 250,
            height: 45,
            decoration: BoxDecoration(
              color:
                  ThemeModel.theme(context) ? Color(0xFF464646) : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(
            Icons.bookmark_border,
            color: Colors.white,
            size: 27,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }
}
