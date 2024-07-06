import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;

  const BottomSheetHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          splashColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(LucideIcons.x),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
