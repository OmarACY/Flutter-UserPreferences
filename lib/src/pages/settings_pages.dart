import 'package:flutter/material.dart';

import 'package:userpreferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor = true;
  int _genre = 1;
  String _name = 'Pedro';

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = new TextEditingController( text: _name);
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
              groupValue: _genre,
              onChanged: (value) {
                setState(() {
                _genre = value;
                });
              }),
          RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genre,
              onChanged: (value) {
                setState(() {
                  _genre = value;
                });
              }),
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
