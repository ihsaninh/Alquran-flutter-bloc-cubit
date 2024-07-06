import 'package:quran_app/features/quran/domain/entities/quran_settings.dart';

class QuranSettingsModel extends QuranSettingsEntity {
  const QuranSettingsModel({
    required super.showTranslation,
    required super.showArabic,
    required super.showLatin,
    required super.showFootnotes,
    required super.arabicFontSize,
    required super.latinFontSize,
  });

  factory QuranSettingsModel.fromJson(Map<String, dynamic> json) {
    return QuranSettingsModel(
      showTranslation: json['show_translation'] ?? false,
      showArabic: json['show_arabic'] ?? false,
      showLatin: json['show_latin'] ?? false,
      showFootnotes: json['show_footnotes'] ?? false,
      arabicFontSize: json['arabic_font_size'] ?? 32,
      latinFontSize: json['latin_font_size'] ?? 14,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'show_translation': showTranslation,
      'show_arabic': showArabic,
      'show_latin': showLatin,
      'show_footnotes': showFootnotes,
      'arabic_font_size': arabicFontSize,
      'latin_font_size': latinFontSize,
    };
  }

  QuranSettingsModel copyWith({
    bool? showTranslation,
    bool? showArabic,
    bool? showLatin,
    bool? showFootnotes,
    double? arabicFontSize,
    double? latinFontSize,
  }) {
    return QuranSettingsModel(
      showTranslation: showTranslation ?? this.showTranslation,
      showArabic: showArabic ?? this.showArabic,
      showLatin: showLatin ?? this.showLatin,
      showFootnotes: showFootnotes ?? this.showFootnotes,
      arabicFontSize: arabicFontSize ?? this.arabicFontSize,
      latinFontSize: latinFontSize ?? this.latinFontSize,
    );
  }
}
