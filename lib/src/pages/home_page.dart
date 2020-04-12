import 'package:flutter/material.dart';
import 'package:userpreferences/src/pages/settings_pages.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
      ),
      drawer: _createMenu(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario:'),
          Divider(),
          Text('Genero:'),
          Divider(),
          Text('Nombre usuario:'),
          Divider(),
        ],
      ),
    );
  }

  Drawer _createMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue),
            title: Text('Party Mode'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('People'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SettingsPage.routeName);
            },
          )
        ],
      ),
    );
  }
}
