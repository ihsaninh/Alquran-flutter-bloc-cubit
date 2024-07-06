import 'package:equatable/equatable.dart';

class QuranLastReadEntity extends Equatable {
  final int index;
  final int ayatNo;
  final String surahName;
  final int totalAyah;
  final DateTime createdAt;

  const QuranLastReadEntity({
    required this.index,
    required this.ayatNo,
    required this.surahName,
    required this.totalAyah,
    required this.createdAt,
  });

  @override
  List<Object> get props {
    return [
      index,
      ayatNo,
      surahName,
      totalAyah,
      createdAt,
    ];
  }
}
