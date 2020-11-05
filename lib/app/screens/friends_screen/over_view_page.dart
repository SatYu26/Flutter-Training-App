import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TSWEarn/app/providers/active_contacts_provider.dart';
import 'package:TSWEarn/app/providers/contacts_provider.dart';
import 'package:TSWEarn/app/services/theme/app_theme_provider.dart';
import 'package:TSWEarn/app/widgets/friends_screen_widgets/active_contacts.dart';
import 'package:TSWEarn/app/widgets/friends_screen_widgets/contact_list.dart';
import 'package:TSWEarn/app/widgets/friends_screen_widgets/rank_container.dart';

class OverViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contact = Provider.of<ContactsProvider>(context).contact;
    final activeContact =
        Provider.of<ActiveContactsProvider>(context).activeContact;
    //final themeMode = Provider.of<AppThemeProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Leaderboard',
            style: TextStyle(
              color: ThemeModel.theme(context)
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20),
          RankContainer(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'From your Contacts (4)',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: ThemeModel.theme(context)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 180,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contact.length,
              itemBuilder: (ctx, i) => ContactList(
                id: contact[i].id,
                name: contact[i].name,
                image: contact[i].image,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Active',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 170,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (ctx, i) => ActiveContacts(
                id: activeContact[i].id,
                image: activeContact[i].image,
                totalSteps: activeContact[i].totalSteps,
              ),
            ),
          ),
          SizedBox(height: 90),
        ],
      ),
    );
  }
}
