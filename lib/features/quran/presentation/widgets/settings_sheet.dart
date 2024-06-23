import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/dictionary.dart';
import 'package:quran_app/features/quran/presentation/widgets/settings_sheet_content_section.dart';
import 'package:quran_app/features/quran/presentation/widgets/settings_sheet_font_section.dart';
import 'package:quran_app/features/quran/presentation/widgets/bottom_sheet_header.dart';

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetHeader(
            title: Dictionary.settingsSurah,
          ),
          SettingsSheetContentSection(),
          SettingsSheetFontSection()
        ],
      ),
    );
  }
}
