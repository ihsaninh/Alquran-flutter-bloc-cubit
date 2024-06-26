import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/dictionary.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/presentation/widgets/tafsir_sheet.dart';

class QuranAyahActions extends StatelessWidget {
  final QuranAyahEntity quranAyah;

  const QuranAyahActions({super.key, required this.quranAyah});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                quranAyah.ayah.toString(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color:
                          Theme.of(context).colorScheme.onPrimaryFixedVariant,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  tooltip: Dictionary.copyAyat,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.content_copy,
                  ),
                ),
                IconButton(
                  tooltip: Dictionary.shareAyat,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_sharp,
                  ),
                ),
                IconButton(
                  tooltip: Dictionary.saveBookmark,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_outline,
                  ),
                ),
                IconButton(
                  tooltip: Dictionary.showTafsir,
                  onPressed: () => _showTafsir(context, quranAyah),
                  icon: const Icon(
                    Icons.book_outlined,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showTafsir(BuildContext context, QuranAyahEntity quranAyah) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (BuildContext context) {
        return TafsirSheet(
          quranAyah: quranAyah,
        );
      },
    );
  }
}
