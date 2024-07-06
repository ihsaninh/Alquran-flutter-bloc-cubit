import 'package:equatable/equatable.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';

class QuranAyahEntity extends Equatable {
  final int id;
  final int surahId;
  final int ayah;
  final int page;
  final int juz;
  final int manzil;
  final String arabic;
  final String kitabah;
  final String latin;
  final List<String> arabicWords;
  final String translation;
  final String footnotes;
  final QuranListEntity surah;

  const QuranAyahEntity({
    required this.id,
    required this.surahId,
    required this.ayah,
    required this.page,
    required this.juz,
    required this.manzil,
    required this.arabic,
    required this.kitabah,
    required this.latin,
    required this.arabicWords,
    required this.translation,
    required this.footnotes,
    required this.surah,
  });

  @override
  List<Object?> get props {
    return [
      id,
      surahId,
      ayah,
      page,
      juz,
      manzil,
      arabic,
      kitabah,
      latin,
      arabicWords,
      translation,
      footnotes,
      surah,
    ];
  }
}
