import 'package:shared_preferences/shared_preferences.dart';
import 'package:userpreferences/src/pages/home_page.dart';

class UserPreferences {

  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences(){
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET and SET for gender
  get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set gender (int value){
    _prefs.setInt('gender', value);
  }

  // GET and SET for secondaryColor
  get secondaryColor {
    return _prefs.getBool('secondaryColor') ?? true;
  }

  set secondaryColor (bool value){
    _prefs.setBool('secondaryColor', value);
  }

  // GET and SET for userName
  get userName {
    return _prefs.getString('userName') ?? '';
  }

  set userName (String value){
    _prefs.setString('userName', value);
  }

  // GET and SET for lastPage
  get lastPage {
    return _prefs.getString('lastPage') ?? HomePage.routeName;
  }

  set lastPage (String value){
    _prefs.setString('lastPage', value);
  }

}