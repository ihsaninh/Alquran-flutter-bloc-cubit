import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quran_app/core/constants/dictionary.dart';

class NavigationItem {
  final IconData icon;
  final String label;

  const NavigationItem({required this.icon, required this.label});
}

const List<NavigationItem> navigationItems = [
  NavigationItem(icon: LucideIcons.home, label: Dictionary.homeTabs),
  NavigationItem(icon: LucideIcons.bookmark, label: Dictionary.bookmarkTabs),
  NavigationItem(icon: LucideIcons.settings, label: Dictionary.settingsTabs),
];
