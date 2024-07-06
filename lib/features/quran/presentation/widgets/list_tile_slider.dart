import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/presentation/widgets/custom_slider.dart';

class ListTileSlider extends StatelessWidget {
  final String title;
  final double min;
  final double max;
  final int divisions;
  final double value;
  final ValueChanged<double> onChanged;
  const ListTileSlider({
    super.key,
    required this.title,
    required this.min,
    required this.max,
    required this.divisions,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
          ),
          SliderTheme(
            data: const SliderThemeData(
              trackShape: CustomSliderTrackShape(),
              thumbShape: CustomSliderThumbShape(),
              overlayShape: CustomSliderOverlayShape(),
            ),
            child: Slider(
              min: min,
              max: max,
              divisions: divisions,
              value: value,
              label: value.round().toString(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
