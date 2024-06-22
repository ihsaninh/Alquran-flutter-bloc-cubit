import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_ayah_actions.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_ayah_tile.dart';

class QuranAyahItem extends StatelessWidget {
  final QuranAyahEntity quranAyah;

  const QuranAyahItem({super.key, required this.quranAyah});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuranAyahActions(quranAyah: quranAyah),
        QuranAyahTile(quranAyah: quranAyah),
      ],
    );
  }
}
