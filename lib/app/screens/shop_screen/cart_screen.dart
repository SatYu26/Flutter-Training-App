import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/shop_screen_widgets/cart_container.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: deviceSize.height,
        color:
            ThemeModel.theme(context) ? Color(0xFF363636) : Color(0xFF4D59DE),
        child: Column(
          children: <Widget>[
            SizedBox(height: deviceSize.height * 0.15),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.chevron_left,
                        size: 45,
                        color: ThemeModel.theme(context)
                            ? Colors.white
                            : Color(0xFF4D59DE),
                      ),
                    ),
                    SizedBox(height: 20),
                    CartContainer(
                      title: 'Nike Sneakers',
                      text: 'Buy Now',
                    ),
                    SizedBox(height: 50),
                    Text(
                      'History',
                      style: TextStyle(
                        color: ThemeModel.theme(context)
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    CartContainer(
                      title: 'Apple Earbuds',
                      text: 'Details',
                    ),
                    SizedBox(height: 20),
                    CartContainer(
                      title: 'Smart Watch',
                      text: 'Details',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
