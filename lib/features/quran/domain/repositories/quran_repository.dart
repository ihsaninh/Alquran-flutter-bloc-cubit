import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/quran/domain/entities/quran_settings.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';
import 'package:quran_app/features/quran/domain/entities/quran_tafsir.dart';

abstract interface class QuranRepository {
  Future<Either<Failure, List<QuranListEntity>>> getQuranList();
  Future<Either<Failure, List<QuranAyahEntity>>> getQuranAyah({
    required String surahId,
  });
  Future<Either<Failure, QuranTafsirEntity>> getQuranTafsir({
    required String id,
  });
  QuranSettingsEntity getAppSettings();
  QuranSettingsEntity setAppSettings({
    required String key,
    required dynamic value,
  });
  void addToLastRead(
      {required QuranListEntity surah,
      required int index,
      required int lastReadAyah});
  Either<Failure, QuranListEntity> getLastRead();
}
