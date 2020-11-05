import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 45,
        decoration: BoxDecoration(
          color: ThemeModel.theme(context) ? Color(0xFF505050) : Colors.white,
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
              border: InputBorder.none),
        ),
      ),
    );
  }
}
