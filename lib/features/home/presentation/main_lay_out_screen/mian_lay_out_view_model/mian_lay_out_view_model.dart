import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/presentation/update_password_view/update_password_view.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/views/home_screen.dart';
import 'package:elevate_ecommerce_driver/utils/assets_manager.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MainLayoutViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  String _currentLanguage;

  static const String _languageKey = 'selected_language';

  MainLayoutViewModel() : _currentLanguage = _getDeviceLocale() {
    _loadLanguage();
  }

  int get selectedIndex => _selectedIndex;
  String get currentLanguage => _currentLanguage;

  List<TabItem> _getTabs() {
    return [
      TabItem(
        icon: SVGAssets.homeTab,
        label: StringsManager.homeTab.tr(),
        screen: HomeScreen(),
      ),
      TabItem(
        icon: SVGAssets.ordersTab,
        label: StringsManager.ordersTab.tr(),
        screen: HomeScreen(),
      ),
      TabItem(
        icon: SVGAssets.personTab,
        label: StringsManager.profileTab.tr(),
        screen: UpdatePasswordView(),
      ),
    ];
  }

  List<TabItem> get tabs => _getTabs();

  void onItemTapped(int index) {
    if (index != _selectedIndex) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  void setLanguage(String language) async {
    if (language != _currentLanguage) {
      _currentLanguage = language;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, language);
    }
  }

  Widget get currentScreen => tabs[_selectedIndex].screen;

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString(_languageKey);

    if (savedLanguage != null) {
      _currentLanguage = savedLanguage;
      notifyListeners();
    }
  }

  static String _getDeviceLocale() {
    final deviceLocale = PlatformDispatcher.instance.locale;
    return deviceLocale.languageCode;
  }
}

class TabItem {
  final String icon;
  final String label;
  final Widget screen;

  TabItem({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
