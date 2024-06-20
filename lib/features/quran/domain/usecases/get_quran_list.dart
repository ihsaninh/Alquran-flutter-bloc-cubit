import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/core/usecase/usecase.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class GetQuranListUseCase implements UseCase<List<QuranListEntity>, NoParams> {
  final QuranRepository _quranRepository;

  GetQuranListUseCase(this._quranRepository);

  @override
  Future<Either<Failure, List<QuranListEntity>>> call(NoParams params) async {
    return _quranRepository.getQuranList();
  }
}
