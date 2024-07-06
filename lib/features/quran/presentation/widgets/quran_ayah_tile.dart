import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/helper.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_settings/quran_settings_bloc.dart';

class QuranAyahTile extends StatelessWidget {
  final QuranAyahEntity quranAyah;

  const QuranAyahTile({super.key, required this.quranAyah});

  @override
  Widget build(BuildContext context) {
    List<String> textParts =
        Helper.findAndSplitSuperscript(quranAyah.translation);
    return BlocBuilder<QuranSettingsBloc, QuranSettingsState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: _buildArabicText(context, state),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLatinText(context, state),
                const SizedBox(height: 8.0),
                _buildTranslationText(context, state, textParts),
                const SizedBox(height: 8.0),
                _buildFootnotes(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildArabicText(BuildContext context, QuranSettingsState state) {
    if (!state.settings.showArabic) return const SizedBox();
    return Text(
      quranAyah.arabic,
      textAlign: TextAlign.right,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            height: 2.5,
            fontFamily: 'LPMQ',
            fontSize: state.settings.arabicFontSize,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
    );
  }

  Widget _buildLatinText(BuildContext context, QuranSettingsState state) {
    if (!state.settings.showLatin) return const SizedBox();
    return Text(
      quranAyah.latin,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            height: 2.0,
            fontSize: state.settings.latinFontSize,
            color:
                Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.7),
          ),
    );
  }

  Widget _buildTranslationText(
      BuildContext context, QuranSettingsState state, List<String> textParts) {
    if (!state.settings.showTranslation) return const SizedBox();
    return RichText(
      textScaler: MediaQuery.textScalerOf(context),
      text: TextSpan(
        children: textParts.map((part) {
          if (Helper.isSuperscript(part)) {
            return WidgetSpan(
              child: Transform.translate(
                offset: const Offset(0, -5),
                child: Text(
                  part,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: state.settings.latinFontSize,
                        color: Colors.red,
                      ),
                ),
              ),
            );
          } else {
            return TextSpan(
              text: part,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    height: 2.0,
                    fontSize: state.settings.latinFontSize,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.8),
                  ),
            );
          }
        }).toList(),
      ),
    );
  }

  Widget _buildFootnotes(BuildContext context, QuranSettingsState state) {
    List<String> textParts =
        Helper.findAndSplitSuperscript(quranAyah.footnotes);

    if (quranAyah.footnotes.isEmpty || !state.settings.showFootnotes) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catatan Kaki',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4.0),
        RichText(
          textScaler: MediaQuery.textScalerOf(context),
          text: TextSpan(
            children: textParts.map((part) {
              if (Helper.isSuperscript(part)) {
                return WidgetSpan(
                  child: Text(
                    part,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                        ),
                  ),
                );
              } else {
                return TextSpan(
                  text: part,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        height: 2.0,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                );
              }
            }).toList(),
          ),
        )
      ],
    );
  }
}
