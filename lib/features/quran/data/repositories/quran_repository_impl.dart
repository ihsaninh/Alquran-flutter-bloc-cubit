import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/quran/data/data_sources/local/quran_local_data_source.dart';
import 'package:quran_app/features/quran/data/data_sources/remote/quran_api_service.dart';
import 'package:quran_app/features/quran/data/models/quran_list.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';
import 'package:quran_app/features/quran/domain/entities/quran_settings.dart';
import 'package:quran_app/features/quran/domain/entities/quran_tafsir.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranApiService _quranApiService;
  final QuranLocalDataSource _quranSettingsDataSource;

  QuranRepositoryImpl(this._quranApiService, this._quranSettingsDataSource);

  @override
  Future<Either<Failure, List<QuranListModel>>> getQuranList() async {
    try {
      final httpResponse = await _quranApiService.getSurahList();
      return right(httpResponse.data);
    } on DioException catch (e) {
      return left(Failure(e.message!));
    }
  }

  @override
  Future<Either<Failure, List<QuranAyahEntity>>> getQuranAyah({
    required String surahId,
  }) async {
    try {
      final httpResponse = await _quranApiService.getSurahAyah(surahId);
      return right(httpResponse.data);
    } on DioException catch (e) {
      return left(Failure(e.message!));
    }
  }

  @override
  Future<Either<Failure, QuranTafsirEntity>> getQuranTafsir({
    required String id,
  }) async {
    try {
      final httpResponse = await _quranApiService.getSurahTafsir(id);
      return right(httpResponse.data);
    } on DioException catch (e) {
      return left(Failure(e.message!));
    }
  }

  @override
  QuranSettingsEntity getAppSettings() {
    return _quranSettingsDataSource.loadQuranSettings();
  }

  @override
  QuranSettingsEntity setAppSettings({
    required String key,
    required dynamic value,
  }) {
    final res = _quranSettingsDataSource.setQuranSettings(
      key: key,
      value: value,
    );
    return res;
  }

  // @override
  // void addToLastRead({
  //   required QuranListEntity surah,
  //   required int index,
  // }) {
  //   _quranSettingsDataSource.addToLastRead(quranModel);
  // }
  @override
  void addToLastRead({
    required QuranListEntity surah,
    required int index,
    required int lastReadAyah,
  }) {
    _quranSettingsDataSource.addToLastRead(surah, index, lastReadAyah);
  }

  @override
  Either<Failure, QuranListEntity> getLastRead() {
    final response = _quranSettingsDataSource.getLastRead();
    if (response == null) {
      return left(Failure('No last read found'));
    }
    return right(response);
  }
}
