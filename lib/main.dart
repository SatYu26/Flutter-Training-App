import 'package:TSWEarn/app/providers/local_state.dart';
import 'package:TSWEarn/app/screens/splash_screen/splash0.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/providers/active_contacts_provider.dart';
import 'app/providers/contacts_provider.dart';
import 'app/providers/levels_provider.dart';
import 'app/providers/monsoon_deals_provider.dart';
import 'app/providers/pedometer_steps_provider.dart';
import 'app/providers/top_trens_items_provider.dart';
import 'app/services/theme/app_theme.dart';
import 'app/services/theme/app_theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  /// OneSignal Initialization
  void initOneSignal(oneSignalAppId) {
    var settings = {
      OSiOSSettings.autoPrompt: true,
      OSiOSSettings.inAppLaunchUrl: true
    };
    OneSignal.shared.init("d4073956-fabf-4724-aac1-1d0e28fec996", iOSSettings: settings);
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
// will be called whenever a notification is received
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      print('Received: ' + notification?.payload?.body ?? '');
    });
// will be called whenever a notification is opened/button pressed.
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('Opened: ' + result.notification?.payload?.body ?? '');
    });
  }

  @override
  void initState() {
    super.initState();
    initOneSignal("d4073956-fabf-4724-aac1-1d0e28fec996");
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MonsoonDealsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LevelProvider(),
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
