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

  Future<void> setBee(String value) {
    return _sharedPreferences!.setString('bees', value);
  }

  String getBee() {
    try {
      return _sharedPreferences!.getString('bees') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFeeds(String value) {
    return _sharedPreferences!.setString('feeds', value);
  }

  String getFeeds() {
    try {
      return _sharedPreferences!.getString('feeds') ?? '';
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

  Future<void> setFarmId(int value) {
    return _sharedPreferences!.setInt('farmid', value);
  }

  int getFarmId() {
    try {
      return _sharedPreferences!.getInt('farmid') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setotherFarmId(int value) {
    return _sharedPreferences!.setInt('otherfarmid', value);
  }

  int getotherFarmId() {
    try {
      return _sharedPreferences!.getInt('otherfarmid') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setCropId(int value) {
    return _sharedPreferences!.setInt('cropid', value);
  }

  int getCropId() {
    try {
      return _sharedPreferences!.getInt('cropid') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setLivestockId(int value) {
    return _sharedPreferences!.setInt('livestockid', value);
  }

  int getLivestockId() {
    try {
      return _sharedPreferences!.getInt('livestockid') ?? 0;
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

  Future<void> setAddFarm(bool value) {
    return _sharedPreferences!.setBool('addfarm', value);
  }

  bool getAddFarm() {
    try {
      return _sharedPreferences!.getBool('addfarm') ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<void> setEditing(bool value) {
    return _sharedPreferences!.setBool('edit', value);
  }

  bool getEditing() {
    try {
      return _sharedPreferences!.getBool('edit') ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<void> setEditId(int value) {
    return _sharedPreferences!.setInt('editId', value);
  }

  int getEditId() {
    try {
      return _sharedPreferences!.getInt('editId') ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<void> setFarmerName(String value) {
    return _sharedPreferences!.setString('farmerName', value);
  }

  String getFarmerName() {
    try {
      return _sharedPreferences!.getString('farmerName') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFarmerIdNo(String value) {
    return _sharedPreferences!.setString('farmerIdNo', value);
  }

  String getFarmerIdNo() {
    try {
      return _sharedPreferences!.getString('farmerIdNo') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setFound(bool value) {
    return _sharedPreferences!.setBool('found', value);
  }

  bool getFound() {
    try {
      return _sharedPreferences!.getBool('found') ?? false;
    } catch (e) {
      return false;
    }
  }
}
