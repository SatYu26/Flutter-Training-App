import 'package:flutter/cupertino.dart';

class TopTrensItems {
  final String id;
  final String image;
  final String title;

  TopTrensItems({
    @required this.id,
    @required this.image,
    @required this.title,
  });
}

class TopTrensItemsProvider with ChangeNotifier {
  List<TopTrensItems> _items = [
    TopTrensItems(
      id: 't1',
      image: 'assets/images/item1.png',
      title: 'Claim Now',
    ),
    TopTrensItems(
      id: 't2',
      image: 'assets/images/item2.png',
      title: 'Claim Now',
    ),
    TopTrensItems(
      id: 't3',
      image: 'assets/images/item3.png',
      title: 'Claim Now',
    ),
  ];

  List<TopTrensItems> get items {
    return [..._items];
  }

  void addItem() {
    notifyListeners();
  }
}
