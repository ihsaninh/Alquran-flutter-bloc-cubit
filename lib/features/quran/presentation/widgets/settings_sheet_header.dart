import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/dictionary.dart';

class SettingsSheetHeader extends StatelessWidget {
  const SettingsSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          splashColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        Text(
          Dictionary.settingsSurah,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
