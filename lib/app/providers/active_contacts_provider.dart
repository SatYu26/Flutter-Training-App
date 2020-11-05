import 'package:flutter/cupertino.dart';

class Actives {
  final String id;
  final String image;
  final int totalSteps;

  Actives({
    @required this.id,
    @required this.image,
    @required this.totalSteps
  });
}

class ActiveContactsProvider with ChangeNotifier {
  List<Actives> _activeContact = [
    Actives(
      id: 'a1',
      image: 'assets/images/person5.png',
      totalSteps: 5000,
    ),
    Actives(
      id: 'a2',
      image: 'assets/images/person6.png',
      totalSteps: 5000,
    ),
    Actives(
      id: 'a3',
      image: 'assets/images/person7.png',
      totalSteps: 5000,
    ),
    Actives(
      id: 'a4',
      image: 'assets/images/person8.png',
      totalSteps: 5000,
    ),
  ];

  List<Actives> get activeContact {
    return [..._activeContact];
  }

  void addcontact() {
    notifyListeners();
  }
}
