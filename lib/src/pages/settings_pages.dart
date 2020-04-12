import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:userpreferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor = true;
  int _gender = 1;
  String _name = 'Pedro';

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
    _textController = new TextEditingController( text: _name);
  }

  _loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _gender = prefs.getInt('gender');
    setState(() { });
  }

  _setSelectedRadio(int value) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('gender', value);

    _gender = value;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body:ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle( fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text('Color secundario'),
            onChanged: (value){
              setState(() {
                _secondaryColor = value;
              });
            },
          ),
          RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _gender,
              onChanged: _setSelectedRadio
          ),
          RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _gender,
              onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona'
              ),
              onChanged: (value){

              },
            ),
          )
        ],
      ),
    );
  }
}
