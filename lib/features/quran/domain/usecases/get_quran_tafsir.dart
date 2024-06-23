import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/core/usecase/usecase.dart';
import 'package:quran_app/features/quran/domain/entities/quran_tafsir.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class GetQuranTafsirUseCase
    implements UseCase<QuranTafsirEntity, SurahTafsirParams> {
  final QuranRepository _quranRepository;
  GetQuranTafsirUseCase(this._quranRepository);

  @override
  Future<Either<Failure, QuranTafsirEntity>> call(
      SurahTafsirParams params) async {
    return await _quranRepository.getQuranTafsir(
      id: params.id,
    );
  }
}

class SurahTafsirParams {
  final String id;

  SurahTafsirParams({
    required this.id,
  });
}
