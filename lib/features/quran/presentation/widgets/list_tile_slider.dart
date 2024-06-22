import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/presentation/widgets/custom_slider.dart';

class ListTileSlider extends StatelessWidget {
  final String title;
  final double value;
  final ValueChanged<double> onChanged;
  const ListTileSlider({
    super.key,
    required this.title,
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
                      .onPrimaryFixedVariant
                      .withOpacity(0.8),
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
              min: 10,
              max: 30,
              divisions: 2,
              value: value,
              label: value.toString(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
