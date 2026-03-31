import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDarkMode = true;
  String _language = 'English';
  bool _notificationsEnabled = true;
  bool _autoPlayEnabled = true;
  bool _dataSaverEnabled = false;

  bool get isDarkMode => _isDarkMode;
  String get language => _language;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get autoPlayEnabled => _autoPlayEnabled;
  bool get dataSaverEnabled => _dataSaverEnabled;

  List<String> availableLanguages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Japanese',
    'Korean',
    'Chinese',
  ];

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? true;
    _language = prefs.getString('language') ?? 'English';
    _notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
    _autoPlayEnabled = prefs.getBool('autoPlayEnabled') ?? true;
    _dataSaverEnabled = prefs.getBool('dataSaverEnabled') ?? false;
    notifyListeners();
  }

  Future<void> setDarkMode(bool value) async {
    _isDarkMode = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
    notifyListeners();
  }

  Future<void> setLanguage(String value) async {
    _language = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', value);
    notifyListeners();
  }

  Future<void> setNotificationsEnabled(bool value) async {
    _notificationsEnabled = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationsEnabled', value);
    notifyListeners();
  }

  Future<void> setAutoPlayEnabled(bool value) async {
    _autoPlayEnabled = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('autoPlayEnabled', value);
    notifyListeners();
  }

  Future<void> setDataSaverEnabled(bool value) async {
    _dataSaverEnabled = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dataSaverEnabled', value);
    notifyListeners();
  }

  Future<void> saveAllSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    await prefs.setString('language', _language);
    await prefs.setBool('notificationsEnabled', _notificationsEnabled);
    await prefs.setBool('autoPlayEnabled', _autoPlayEnabled);
    await prefs.setBool('dataSaverEnabled', _dataSaverEnabled);
  }
}
