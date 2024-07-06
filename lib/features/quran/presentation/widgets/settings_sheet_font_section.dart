import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_settings/quran_settings_bloc.dart';
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
          BlocBuilder<QuranSettingsBloc, QuranSettingsState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    ListTileSlider(
                      title: "Ukuran Font Arabic",
                      min: 16,
                      max: 40,
                      divisions: 12,
                      value: state.settings.arabicFontSize,
                      onChanged: (value) =>
                          context.read<QuranSettingsBloc>().add(
                                SetQuranSettings(
                                  key: 'arabicFontSize',
                                  value: value,
                                ),
                              ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ListTileSlider(
                      title: "Ukuran Font Terjemahan/Latin",
                      min: 12,
                      max: 30,
                      divisions: 9,
                      value: state.settings.latinFontSize,
                      onChanged: (value) =>
                          context.read<QuranSettingsBloc>().add(
                                SetQuranSettings(
                                  key: 'latinFontSize',
                                  value: value,
                                ),
                              ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
