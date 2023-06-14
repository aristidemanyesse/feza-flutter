import 'dart:async';
import 'dart:convert';
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

  Future<List<Map<String, dynamic>>> getMapList(String key) async {
    final jsonString = _prefs?.getString(key) ?? '';
    if (jsonString.isEmpty) {
      return [];
    }
    final jsonList = jsonDecode(jsonString);
    return List<Map<String, dynamic>>.from(jsonList);
  }

  Future<void> setMapList(String key, List<Map<String, dynamic>> value) async {
    final jsonString = jsonEncode(value);
    await _prefs?.setString(key, jsonString);
    _valueStreamController.add(jsonString);
  }

  Stream<List<Map<String, dynamic>>> watchMapList(String key) {
    return _valueStreamController.stream.map((jsonString) {
      final jsonList = jsonDecode(jsonString);
      return List<Map<String, dynamic>>.from(jsonList);
    });
  }

  Future<List<T>> getObjectList<T>(
      String key, T Function(Map<String, dynamic>) fromJson) async {
    final jsonString = _prefs?.getString(key) ?? '';
    if (jsonString.isEmpty) {
      return [];
    }
    final jsonArray = jsonDecode(jsonString);
    return List<T>.from(jsonArray.map((json) => fromJson(json)));
  }

  Future<void> setObjectList<T>(
      String key, List<T> value, dynamic Function(T) toJson) async {
    final jsonArray = value.map((item) => toJson(item)).toList();
    final jsonString = jsonEncode(jsonArray);
    await _prefs?.setString(key, jsonString);
    _valueStreamController.add(jsonString);
  }

  Stream<List<T>> watchObjectList<T>(
      String key, T Function(Map<String, dynamic>) fromJson) {
    return _valueStreamController.stream.map((jsonString) {
      final jsonArray = jsonDecode(jsonString);
      return List<T>.from(jsonArray.map((json) => fromJson(json)));
    });
  }
}
