import 'package:flutter/cupertino.dart';

class Contacts {
  final String id;
  final String name;
  final String image;

  Contacts({
    @required this.id,
    @required this.name,
    @required this.image,
  });
}

class ContactsProvider with ChangeNotifier {
  List<Contacts> _contact = [
    Contacts(
      id: 'c1',
      name: '@username',
      image: 'assets/images/person1.png',
    ),
    Contacts(
      id: 'c2',
      name: '@username',
      image: 'assets/images/person2.png',
    ),
    Contacts(
      id: 'c3',
      name: '@username',
      image: 'assets/images/person3.png',
    ),
    Contacts(
      id: 'c4',
      name: '@username',
      image: 'assets/images/person4.png',
    ),
  ];

  List<Contacts> get contact {
    return [..._contact];
  }

  void addcontact() {
    notifyListeners();
  }
}
