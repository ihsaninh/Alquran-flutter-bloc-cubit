import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class GetQuranLastReadUseCase {
  final QuranRepository _quranRepository;

  GetQuranLastReadUseCase(this._quranRepository);

  Either<Failure, QuranListEntity> call() {
    return _quranRepository.getLastRead();
  }
}
