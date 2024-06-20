import 'package:quran_app/features/quran/domain/entities/quran_list.dart';

class QuranListModel extends QuranListEntity {
  const QuranListModel({
    required super.id,
    required super.arabic,
    required super.latin,
    required super.transliteration,
    required super.translation,
    required super.numAyah,
    required super.page,
    required super.location,
  });

  factory QuranListModel.fromJson(Map<String, dynamic> json) {
    return QuranListModel(
      id: json['id'] ?? 0,
      arabic: json['arabic'] ?? '',
      latin: json['latin'] ?? '',
      transliteration: json['transliteration'] ?? '',
      translation: json['translation'] ?? '',
      numAyah: json['num_ayah'] ?? 0,
      page: json['page'] ?? 0,
      location: json['location'] ?? '',
    );
  }
}
