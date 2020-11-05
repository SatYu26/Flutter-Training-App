import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TSWEarn/app/providers/monsoon_deals_provider.dart';
import 'package:TSWEarn/app/providers/top_trens_items_provider.dart';
import 'package:TSWEarn/app/widgets/shop_screen_widgets/categories.dart';
import 'package:TSWEarn/app/widgets/shop_screen_widgets/monsoon_deals_list_view.dart';
import 'package:TSWEarn/app/widgets/shop_screen_widgets/search_row.dart';
import 'package:TSWEarn/app/widgets/shop_screen_widgets/top_trends_list_view.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final item =
        Provider.of<MonsoonDealsProvider>(context, listen: false).items;
    final product =
        Provider.of<TopTrensItemsProvider>(context, listen: false).items;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: deviceSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: deviceSize.height * 0.08),
            SearchRow(),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ListView(
                    children: <Widget>[
                      Categories(),
                      SizedBox(height: 30),
                      Text(
                        'Monsoon Deals',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: item.length,
                          itemBuilder: (ctx, i) => Products(
                            id: item[i].id,
                            image: item[i].svgAssets,
                            title: item[i].title,
                            width: 240,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Top Trends',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.length,
                          itemBuilder: (ctx, i) => TopTrendsListItems(
                            id: product[i].id,
                            image: product[i].image,
                            title: product[i].title,
                            width: 120,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/images/im.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
