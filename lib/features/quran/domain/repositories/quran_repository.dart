import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';

abstract interface class QuranRepository {
  Future<Either<Failure, List<QuranListEntity>>> getQuranList();
  Future<Either<Failure, List<QuranAyahEntity>>> getQuranAyah({
    required String surahId,
  });
}