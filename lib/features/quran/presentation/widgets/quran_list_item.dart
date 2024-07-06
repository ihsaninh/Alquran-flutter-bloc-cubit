import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';

class QuranListItem extends StatelessWidget {
  final QuranListEntity quranList;

  const QuranListItem({super.key, required this.quranList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.secondaryContainer,
      onTap: () {
        context.pushNamed("quran-ayah", extra: quranList);
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
                      'assets/images/octagon.svg',
                      width: 48,
                      height: 48,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant
                            .withOpacity(0.7),
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      quranList.id.toString(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant
                                .withOpacity(0.8),
                          ),
                    ),
                  ],
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quranList.latin,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "${quranList.numAyah} Ayat | ${quranList.location}",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant
                                .withOpacity(0.7),
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              quranList.arabic,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant
                        .withOpacity(0.7),
                    fontFamily: 'LPMQ',
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
