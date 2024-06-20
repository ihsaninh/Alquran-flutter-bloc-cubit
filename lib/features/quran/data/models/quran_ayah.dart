import 'package:quran_app/features/quran/data/models/quran_list.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';

class QuranAyahModel extends QuranAyahEntity {
  const QuranAyahModel({
    required super.id,
    required super.surahId,
    required super.ayah,
    required super.page,
    required super.juz,
    required super.manzil,
    required super.arabic,
    required super.kitabah,
    required super.latin,
    required super.arabicWords,
    required super.translation,
    required super.footnotes,
    required super.surah,
  });

  factory QuranAyahModel.fromJson(Map<String, dynamic> json) {
    return QuranAyahModel(
      id: json['id'] ?? 0,
      surahId: json['surah_id'] ?? 0,
      ayah: json['ayah'] ?? 0,
      page: json['page'] ?? 0,
      juz: json['juz'] ?? 0,
      manzil: json['manzil'] ?? 0,
      arabic: json['arabic'] ?? '',
      kitabah: json['kitabah'] ?? '',
      latin: json['latin'] ?? '',
      arabicWords: json['arabic_words'] != null
          ? List<String>.from(json['arabic_words'])
          : [],
      translation: json['translation'] ?? '',
      footnotes: json['footnotes'] ?? '',
      surah: json['surah'] != null
          ? QuranListModel.fromJson(json['surah'])
          : const QuranListModel(
              id: 0,
              arabic: '',
              latin: '',
              transliteration: '',
              translation: '',
              numAyah: 0,
              page: 0,
              location: '',
            ),
    );
  }
}
