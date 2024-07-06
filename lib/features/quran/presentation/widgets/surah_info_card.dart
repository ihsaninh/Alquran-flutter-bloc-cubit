import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';

class SurahInfoCard extends StatelessWidget {
  final QuranListEntity surah;
  const SurahInfoCard({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      child: Card.filled(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                surah.latin,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 4.0),
              Text(
                surah.translation,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurfaceVariant
                          .withOpacity(0.7),
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                "${surah.numAyah} Ayat",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurfaceVariant
                          .withOpacity(0.7),
                    ),
              ),
              const SizedBox(height: 4.0),
              Text(
                surah.location,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurfaceVariant
                          .withOpacity(0.7),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
