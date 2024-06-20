import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/quran/data/datasources/remote/quran_api_service.dart';
import 'package:quran_app/features/quran/data/models/quran_list.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranApiService _quranApiService;

  QuranRepositoryImpl(this._quranApiService);

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
}
