import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  SharedPreferences? _prefs;
  StreamController<String> _valueStreamController =
      StreamController<String>.broadcast();

  SharedPreferencesService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String> getString(String key) async {
    return _prefs?.getString(key) ?? '';
  }

  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
    _valueStreamController
        .add(value); // Émettre la nouvelle valeur aux écouteurs
  }

  Future<List<String>> getStringList(String key) async {
    return _prefs?.getStringList(key) ?? [];
  }

  Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
    _valueStreamController
        .add(value.toString()); // Émettre la nouvelle valeur aux écouteurs
  }

  Stream<String> watchString(String key) {
    return _valueStreamController.stream;
  }

  Stream<List<String>> watchStringList(String key) {
    return _valueStreamController.stream
        .map((value) => value.split(',').map((item) => item.trim()).toList());
  }
}
