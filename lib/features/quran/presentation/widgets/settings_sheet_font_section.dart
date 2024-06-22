import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/presentation/widgets/list_tile_select.dart';
import 'package:quran_app/features/quran/presentation/widgets/list_tile_slider.dart';
import 'package:quran_app/features/quran/presentation/widgets/section_title.dart';

class SettingsSheetFontSection extends StatelessWidget {
  const SettingsSheetFontSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Setelan Font'),
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                const ListTileSelect(title: "Font"),
                const SizedBox(
                  height: 16.0,
                ),
                ListTileSlider(
                  title: "Ukuran Font Arabic",
                  value: 18,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ListTileSlider(
                  title: "Ukuran Font Terjemahan/Tafsir",
                  value: 18,
                  onChanged: (value) {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
