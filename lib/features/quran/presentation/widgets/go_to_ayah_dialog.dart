import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';

class GoToAyahDialog extends StatelessWidget {
  final QuranListEntity surah;
  final void Function()? onPressed;
  final void Function(String)? onChanged;

  const GoToAyahDialog({
    super.key,
    required this.surah,
    this.onPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.all(16.0),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      title: Text(
        "Pergi ke ayat",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
      ),
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Masukkan nomor ayat antara 1-${surah.numAyah}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              width: 50.0,
              child: TextField(
                onChanged: onChanged,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  alignLabelWithHint: true,
                  hintText: "1-${surah.numAyah}",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text('Oke'),
        ),
      ],
    );
  }
}
