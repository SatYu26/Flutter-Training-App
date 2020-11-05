import 'package:flutter/material.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';

class AllFriendContainer extends StatelessWidget {
  final String text;
  final String name;
  final String image;

  AllFriendContainer({
    @required this.text,
    @required this.name,
    @required this.image,
  });
  @override
  Widget build(BuildContext context) {
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                      color: ThemeModel.theme(context)
                          ? Colors.white
                          : Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                '10d',
                style: TextStyle(
                  color: ThemeModel.theme(context) ? Colors.white : Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
