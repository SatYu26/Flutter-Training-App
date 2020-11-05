import 'package:flutter/material.dart';
import 'package:TSWEarn/app/screens/shop_screen/claim_screem.dart';

class Products extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final double width;
  Products({
    @required this.id,
    @required this.image,
    @required this.title,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ClaimScreen(productId: id),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: width,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                        icon: Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
