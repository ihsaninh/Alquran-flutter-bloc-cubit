import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_ayah_actions.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_ayah_tile.dart';

class QuranAyahItem extends StatelessWidget {
  final QuranAyahEntity quranAyah;
  final int index;

  const QuranAyahItem({
    super.key,
    required this.quranAyah,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuranAyahActions(quranAyah: quranAyah, index: index),
        QuranAyahTile(quranAyah: quranAyah)
      ],
    );
  }
}
