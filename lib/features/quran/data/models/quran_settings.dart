import 'package:quran_app/features/quran/domain/entities/quran_settings.dart';

class QuranSettingsModel extends QuranSettingsEntity {
  const QuranSettingsModel({
    required super.showTranslation,
    required super.showArabic,
    required super.showLatin,
    required super.showFootnotes,
  });

  factory QuranSettingsModel.fromJson(Map<String, dynamic> json) {
    return QuranSettingsModel(
      showTranslation: json['show_translation'] ?? false,
      showArabic: json['show_arabic'] ?? false,
      showLatin: json['show_latin'] ?? false,
      showFootnotes: json['show_footnotes'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'show_translation': showTranslation,
      'show_arabic': showArabic,
      'show_latin': showLatin,
      'show_footnotes': showFootnotes,
    };
  }

  QuranSettingsModel copyWith({
    bool? showTranslation,
    bool? showArabic,
    bool? showLatin,
    bool? showFootnotes,
  }) {
    return QuranSettingsModel(
      showTranslation: showTranslation ?? this.showTranslation,
      showArabic: showArabic ?? this.showArabic,
      showLatin: showLatin ?? this.showLatin,
      showFootnotes: showFootnotes ?? this.showFootnotes,
    );
  }
}
