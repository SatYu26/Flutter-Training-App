import 'dart:math';

import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TSWEarn/app/providers/monsoon_deals_provider.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:flutter/rendering.dart';

class ClaimScreen extends StatelessWidget {
  final String productId;
  ClaimScreen({this.productId});
  static const routeName = '/claim';
  @override
  Widget build(BuildContext context) {
    //final productId = ModalRoute.of(context).settings.arguments as String;
    final products = Provider.of<MonsoonDealsProvider>(context).items;
    final productData =
        products.firstWhere((product) => product.id == productId);
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    final localStates = Provider.of<LocalState>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => localStates.increasTaps(),
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: ImageHeader(
                  maxExtent: 350,
                  minExtent: 200,
                  image: productData.svgAssets,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ThemeModel.theme(context)
                            ? Color(0xFF505050)
                            : Colors.white,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 20, right: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'What’s Inside',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ThemeModel.theme(context)
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero,',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ThemeModel.theme(context)
                                      ? Color(0xFFEFEFEF)
                                      : Colors.grey[500],
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'How to redeem',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ThemeModel.theme(context)
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, , sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscin, sed diam nonumy eirmod',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ThemeModel.theme(context)
                                      ? Color(0xFFEFEFEF)
                                      : Colors.grey[500],
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4D59DE),
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(30),
                                    right: Radius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  'Redeem Coins',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 250),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageHeader implements SliverPersistentHeaderDelegate {
  ImageHeader({
    this.minExtent,
    @required this.maxExtent,
    @required this.image,
    @required this.onTap,
  });
  final double minExtent;
  final double maxExtent;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          child: Image.asset(
            image, //productData.svgAssets,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 40,
          left: 0,
          child: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 50,
              color: Colors.white,
            ),
            onPressed: onTap,
          ),
        ),
        Positioned(
          top: 100,
          left: 60,
          child: Text(
            '40% Off',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white.withOpacity(
                  titleOpacity(shrinkOffset),
                ),
                fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: themeMode.isDark ? Color(0xFF505050) : Colors.white,
              ),
            ))
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration => throw UnimplementedError();

  @override
  // TODO: implement vsync
  TickerProvider get vsync => throw UnimplementedError();

}
