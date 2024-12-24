import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  final _isDarkMode = false.obs;
  final _isRTL = false.obs;

  bool get isDarkMode => _isDarkMode.value;
  bool get isRTL => _isRTL.value;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
    _isRTL.value = prefs.getBool('isRTL') ?? false;
    
    // تطبيق الإعدادات
    updateTheme();
    updateLanguage();
  }

  Future<void> toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode.value);
    updateTheme();
  }

  Future<void> toggleLanguage() async {
    _isRTL.value = !_isRTL.value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRTL', _isRTL.value);
    updateLanguage();
  }

  void updateTheme() {
    Get.changeTheme(
      _isDarkMode.value ? ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF000080),
        scaffoldBackgroundColor: Colors.black,
      ) : ThemeData.light().copyWith(
        primaryColor: const Color(0xFF000080),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }

  void updateLanguage() {
    Get.updateLocale(_isRTL.value ? const Locale('ar') : const Locale('en'));
  }
} 