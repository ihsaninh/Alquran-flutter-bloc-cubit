import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18.0,
            color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
    );
  }
}
