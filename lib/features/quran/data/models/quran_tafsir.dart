import 'package:quran_app/features/quran/domain/entities/quran_tafsir.dart';

class QuranTafsirModel extends QuranTafsirEntity {
  const QuranTafsirModel({
    required super.wajiz,
    required super.tahlili,
  });

  factory QuranTafsirModel.fromJson(Map<String, dynamic> json) {
    return QuranTafsirModel(
      wajiz: json['wajiz'] ?? '',
      tahlili: json['tahlili'] ?? '',
    );
  }
}
