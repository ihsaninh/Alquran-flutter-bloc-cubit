import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/dictionary.dart';
import 'package:quran_app/features/quran/presentation/widgets/appbar.dart';

class QuranAyah extends StatefulWidget {
  final String surahId;
  final String surahName;

  const QuranAyah({
    super.key,
    required this.surahId,
    required this.surahName,
  });

  @override
  State<QuranAyah> createState() => _QuranAyahState();
}

class _QuranAyahState extends State<QuranAyah> {
  double _currentSliderValue = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        title: "${widget.surahId}. ${widget.surahName}",
        actions: [
          IconButton(
            splashColor: Theme.of(context).colorScheme.secondaryContainer,
            onPressed: _showBottomSheet,
            icon: const Icon(Icons.tune_rounded),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showBottomSheet,
          child: const Text('showModalBottomSheet'),
        ),
      ),
    );
  }

  _showBottomSheet() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Column(
              children: [
                _buildbottomSheetHeader(),
                _buildbottomSheetContentSettings(),
                _buildbottomSheetFontSettings(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildbottomSheetHeader() {
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

  _buildbottomSheetContentSettings() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Konten'),
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                _buildlistTile("Arabic"),
                _buildlistTile("Terjemahan"),
                _buildlistTile("Tafsir"),
              ],
            ),
          )
        ],
      ),
    );
  }

  _sectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18.0,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
    );
  }

  _buildlistTile(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                fontWeight: FontWeight.w500,
              ),
        ),
        trailing: Transform.scale(
          scale: 0.8,
          child: Switch(
            // This bool value toggles the switch.
            value: true,
            onChanged: (bool value) {},
          ),
        ),
      ),
    );
  }

  _buildlistTileSelect(String title) {
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
                  color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Row(
            children: [
              Text(
                "LPMQ Kemenag",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color:
                          Theme.of(context).colorScheme.onPrimaryFixedVariant,
                    ),
              ),
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

  _buildlistTileSlider(String title) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Slider(
            max: 30,
            min: 10,
            value: _currentSliderValue,
            label: _currentSliderValue.toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }

  _buildbottomSheetFontSettings() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Setelan Font'),
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                _buildlistTileSelect("Font"),
                const SizedBox(
                  height: 16.0,
                ),
                _buildlistTileSlider("Ukuran Font Arabic"),
                const SizedBox(
                  height: 16.0,
                ),
                _buildlistTileSlider("Ukuran Font Terjemahan/Tafsir"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
