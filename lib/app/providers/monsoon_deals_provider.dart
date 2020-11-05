import 'package:flutter/cupertino.dart';

class MonsoonDeals {
  final String id;
  final String svgAssets;
  final String title;

  MonsoonDeals({
    @required this.id,
    @required this.svgAssets,
    @required this.title,
  });
}

class MonsoonDealsProvider with ChangeNotifier {
  List<MonsoonDeals> _items = [
    MonsoonDeals(
      id: 'i1',
      svgAssets: 'assets/images/product1.png',
      title: 'Monsoon Deals @NIKE',
    ),
    MonsoonDeals(
      id: 'i2',
      svgAssets: 'assets/images/product2.png',
      title: 'Voucher Deals @NIKE',
    ),
  ];

  List<MonsoonDeals> get items {
    return [..._items];
  }

  void addItem() {
    notifyListeners();
  }
}
