import 'package:equatable/equatable.dart';

class QuranListEntity extends Equatable {
  final int id;
  final String arabic;
  final String latin;
  final String transliteration;
  final String translation;
  final int numAyah;
  final int page;
  final String location;
  final int? index;
  final int? lastReadAyah;
  final DateTime? createdAt;

  const QuranListEntity({
    required this.id,
    required this.arabic,
    required this.latin,
    required this.transliteration,
    required this.translation,
    required this.numAyah,
    required this.page,
    required this.location,
    this.index,
    this.lastReadAyah,
    this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      arabic,
      latin,
      transliteration,
      translation,
      numAyah,
      page,
      location,
      index,
      lastReadAyah,
      createdAt,
    ];
  }
}
