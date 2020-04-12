import 'package:flutter/material.dart';

import 'package:userpreferences/src/pages/home_page.dart';
import 'package:userpreferences/src/pages/settings_pages.dart';
import 'package:userpreferences/src/shared_prefs/user_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}