import 'package:equatable/equatable.dart';

class QuranSettingsEntity extends Equatable {
  final bool showTranslation;
  final bool showArabic;
  final bool showLatin;
  final bool showFootnotes;

  const QuranSettingsEntity({
    required this.showTranslation,
    required this.showArabic,
    required this.showLatin,
    required this.showFootnotes,
  });

  @override
  List<Object> get props {
    return [
      showTranslation,
      showArabic,
      showLatin,
      showFootnotes,
    ];
  }
}
