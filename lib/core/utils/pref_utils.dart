import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  Future<void> setToken(String value) {
    return _sharedPreferences!.setString('token', value);
  }

  String getToken() {
    try {
      return _sharedPreferences!.getString('token') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setDBPath(String value) {
    return _sharedPreferences!.setString('dbpath', value);
  }

  String getDBPath() {
    try {
      return _sharedPreferences!.getString('dbpath') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setAgeGroups(String value) {
    return _sharedPreferences!.setString('agegroups', value);
  }

  String getAgeGroups() {
    try {
      return _sharedPreferences!.getString('agegroups') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFarmerId(int value) {
    return _sharedPreferences!.setInt('farmerid', value);
  }

  int getFarmerId() {
    try {
      return _sharedPreferences!.getInt('farmerid') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setAddorEdit(bool value) {
    return _sharedPreferences!.setBool('addoredit', value);
  }

  bool getAddorEdit() {
    try {
      return _sharedPreferences!.getBool('addoredit') ?? false;
    } catch (e) {
      return false;
    }
  }
}
