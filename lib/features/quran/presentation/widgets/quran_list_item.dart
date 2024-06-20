import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';

class QuranListItem extends StatelessWidget {
  final QuranListEntity quranListEntity;

  const QuranListItem({super.key, required this.quranListEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.secondaryContainer,
      onTap: () {
        context.push(
          '/quran-ayah/${quranListEntity.id}?surahName=${quranListEntity.latin}',
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/ocatagon.svg',
                      width: 48,
                      height: 48,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      quranListEntity.id.toString(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryFixedVariant,
                          ),
                    ),
                  ],
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quranListEntity.latin,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "${quranListEntity.numAyah} Ayat | ${quranListEntity.location}",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryFixedVariant
                                .withOpacity(0.8),
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              quranListEntity.arabic,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryFixedVariant
                        .withOpacity(0.8),
                    fontFamily: 'LPMQ',
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
