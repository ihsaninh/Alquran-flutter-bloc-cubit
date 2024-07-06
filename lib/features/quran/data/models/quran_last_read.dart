import 'package:quran_app/features/quran/domain/entities/quran_last_read.dart';

class QuranLastReadModel extends QuranLastReadEntity {
  const QuranLastReadModel({
    required super.index,
    required super.ayatNo,
    required super.surahName,
    required super.totalAyah,
    required super.createdAt,
  });

  factory QuranLastReadModel.fromJson(Map<String, dynamic> json) {
    return QuranLastReadModel(
      index: json['index'] ?? 0,
      ayatNo: json['ayat_no'] ?? 0,
      surahName: json['surah_name'] ?? '',
      totalAyah: json['total_ayah'] ?? 0,
      createdAt: json['created_At'] ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'ayat_no': ayatNo,
      'surah_name': surahName,
      'total_ayah': totalAyah,
      'created_At': createdAt,
    };
  }

  QuranLastReadModel copyWith({
    int? index,
    int? ayatNo,
    String? surahName,
    int? totalAyah,
    DateTime? createdAt,
  }) {
    return QuranLastReadModel(
      index: index ?? this.index,
      ayatNo: ayatNo ?? this.ayatNo,
      surahName: surahName ?? this.surahName,
      totalAyah: totalAyah ?? this.totalAyah,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
