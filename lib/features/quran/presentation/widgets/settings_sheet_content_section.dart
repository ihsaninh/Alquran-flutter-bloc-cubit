import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_settings/quran_settings_bloc.dart';
import 'package:quran_app/features/quran/presentation/widgets/list_tile_switch.dart';
import 'package:quran_app/features/quran/presentation/widgets/section_title.dart';

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
          BlocBuilder<QuranSettingsBloc, QuranSettingsState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    ListTileSwitch(
                      title: "Arabic",
                      value: state.settings.showArabic,
                      onChanged: (value) =>
                          context.read<QuranSettingsBloc>().add(
                                SetQuranSettings(
                                  key: 'showArabic',
                                  value: value,
                                ),
                              ),
                    ),
                    ListTileSwitch(
                      title: "Terjemahan",
                      value: state.settings.showTranslation,
                      onChanged: (value) =>
                          context.read<QuranSettingsBloc>().add(
                                SetQuranSettings(
                                  key: 'showTranslation',
                                  value: value,
                                ),
                              ),
                    ),
                    ListTileSwitch(
                      title: "Latin",
                      value: state.settings.showLatin,
                      onChanged: (value) =>
                          context.read<QuranSettingsBloc>().add(
                                SetQuranSettings(
                                  key: 'showLatin',
                                  value: value,
                                ),
                              ),
                    ),
                    ListTileSwitch(
                      title: "Catatan Kaki",
                      value: state.settings.showFootnotes,
                      onChanged: (value) =>
                          context.read<QuranSettingsBloc>().add(
                                SetQuranSettings(
                                  key: 'showFootnotes',
                                  value: value,
                                ),
                              ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
