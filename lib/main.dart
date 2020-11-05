import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:TSWEarn/app/screens/splash_screen/splash0.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/providers/active_contacts_provider.dart';
import 'app/providers/contacts_provider.dart';
import 'app/providers/monsoon_deals_provider.dart';
import 'app/providers/pedometer_steps_provider.dart';
import 'app/providers/top_trens_items_provider.dart';
import 'app/services/theme/app_theme.dart';
import 'app/services/theme/app_theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MonsoonDealsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TopTrensItemsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ContactsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ActiveContactsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AppThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LocalState(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PedometerStepsProvider(),
        ),
      ],
      child: Consumer<AppThemeProvider>(
        builder: (_, themeState, __) {
          return MaterialApp(
            title: 'TSWEarn',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: StartSplash(),
          );
        },
      ),
    );
  }
}
// Color(0xFF222222),
// Color(0xFF101010)
