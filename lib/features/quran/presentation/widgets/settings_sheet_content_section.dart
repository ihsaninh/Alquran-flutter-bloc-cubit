import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/presentation/widgets/section_title.dart';
import 'package:quran_app/features/quran/presentation/widgets/list_tile_switch.dart';

class SettingsSheetContentSection extends StatelessWidget {
  const SettingsSheetContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Konten'),
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                ListTileSwitch(
                  title: "Arabic",
                  value: true,
                  onChanged: (value) {},
                ),
                ListTileSwitch(
                  title: "Terjemahan",
                  value: true,
                  onChanged: (value) {},
                ),
                ListTileSwitch(
                  title: "Latin",
                  value: false,
                  onChanged: (value) {},
                ),
                ListTileSwitch(
                  title: "Catatan Kaki",
                  value: false,
                  onChanged: (value) {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
