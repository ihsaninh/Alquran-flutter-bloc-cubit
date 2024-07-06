import 'package:equatable/equatable.dart';

class QuranSettingsEntity extends Equatable {
  final bool showTranslation;
  final bool showArabic;
  final bool showLatin;
  final bool showFootnotes;
  final double arabicFontSize;
  final double latinFontSize;

  const QuranSettingsEntity({
    required this.showTranslation,
    required this.showArabic,
    required this.showLatin,
    required this.showFootnotes,
    required this.arabicFontSize,
    required this.latinFontSize,
  });

  @override
  List<Object> get props {
    return [
      showTranslation,
      showArabic,
      showLatin,
      showFootnotes,
      arabicFontSize,
      latinFontSize,
    ];
  }
}
