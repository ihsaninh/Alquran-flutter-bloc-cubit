import 'package:flutter/material.dart';

class ListTileSelect extends StatelessWidget {
  final String title;

  const ListTileSelect({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16.0),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryFixedVariant
                      .withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
          ),
          Row(
            children: [
              Text(
                "LPMQ Kemenag",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryFixedVariant
                          .withOpacity(0.8),
                    ),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          )
        ],
      ),
    );
  }
}
