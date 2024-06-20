import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/core/usecase/usecase.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class GetQuranAyahUseCase
    implements UseCase<List<QuranAyahEntity>, SurahAyahParams> {
  final QuranRepository _quranRepository;
  GetQuranAyahUseCase(this._quranRepository);

  @override
  Future<Either<Failure, List<QuranAyahEntity>>> call(
      SurahAyahParams params) async {
    return await _quranRepository.getQuranAyah(
      surahId: params.surahId,
    );
  }
}

class SurahAyahParams {
  final String surahId;

  SurahAyahParams({
    required this.surahId,
  });
}
