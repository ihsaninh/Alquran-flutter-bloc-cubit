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
        return switch (state) {
          QuranSettingsInitial() => const SizedBox(),
          QuranSettingsLoadFailure() => const SizedBox(),
          QuranSettingsLoadSuccess() => ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: state.settings.showArabic
                  ? Text(
                      quranAyah.arabic,
                      textAlign: TextAlign.right,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                            height: 2.6,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontFamily: 'LPMQ',
                          ),
                    )
                  : null,
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state.settings.showLatin
                        ? Text(
                            quranAyah.latin,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  height: 2.5,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryFixedVariant
                                      .withOpacity(0.8),
                                ),
                          )
                        : const SizedBox(),
                    state.settings.showTranslation
                        ? RichText(
                            text: TextSpan(
                              children: textParts.map((part) {
                                if (Helper.isSuperscript(part)) {
                                  return WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0, -5),
                                      child: Text(
                                        part,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red,
                                            ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return TextSpan(
                                    text: part,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                            height: 2,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant),
                                  );
                                }
                              }).toList(),
                            ),
                          )
                        : const SizedBox(),
                    quranAyah.footnotes != '' && state.settings.showFootnotes
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Catatan Kaki',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                quranAyah.footnotes,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        height: 2,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant),
                              )
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
        };
      },
    );
  }
}
