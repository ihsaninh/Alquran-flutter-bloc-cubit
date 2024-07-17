import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';

class SurahBasmallah extends StatelessWidget {
  final QuranListEntity surah;
  const SurahBasmallah({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    if (surah.id == 1 || surah.id == 9) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 32.0,
      ),
      child: SvgPicture.asset(
        'assets/images/bismillah.svg',
        width: 48,
        height: 48,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSurfaceVariant,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
