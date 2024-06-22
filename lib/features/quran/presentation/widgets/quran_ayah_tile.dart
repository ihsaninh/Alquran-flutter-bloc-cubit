import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/helper.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';

class QuranAyahTile extends StatelessWidget {
  final QuranAyahEntity quranAyah;

  const QuranAyahTile({super.key, required this.quranAyah});

  @override
  Widget build(BuildContext context) {
    List<String> textParts =
        Helper.findAndSplitSuperscript(quranAyah.translation);
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      title: Text(
        quranAyah.arabic,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              height: 2.6,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontFamily: 'LPMQ',
            ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: RichText(
          text: TextSpan(
            children: textParts.map((part) {
              if (Helper.isSuperscript(part)) {
                return WidgetSpan(
                  child: Transform.translate(
                    offset: const Offset(0, -5),
                    child: Text(
                      part,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                          ),
                    ),
                  ),
                );
              } else {
                return TextSpan(
                  text: part,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        height: 2.5,
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryFixedVariant
                            .withOpacity(0.8),
                      ),
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }
}
