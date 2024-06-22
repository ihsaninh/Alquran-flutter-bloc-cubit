import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final double padding;

  const SectionTitle({super.key, required this.title, this.padding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18.0,
            color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
    );
  }
}
