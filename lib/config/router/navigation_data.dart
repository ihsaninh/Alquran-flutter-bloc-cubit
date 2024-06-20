import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/dictionary.dart';

class NavigationItem {
  final IconData icon;
  final String label;

  const NavigationItem({required this.icon, required this.label});
}

const List<NavigationItem> navigationItems = [
  NavigationItem(icon: Icons.home, label: Dictionary.homeTabs),
  NavigationItem(icon: Icons.bookmark, label: Dictionary.bookmarkTabs),
  NavigationItem(icon: Icons.settings, label: Dictionary.settingsTabs),
];
