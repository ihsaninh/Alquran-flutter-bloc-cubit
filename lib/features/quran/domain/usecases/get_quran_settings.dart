import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/core/usecase/usecase.dart';
import 'package:quran_app/features/quran/domain/entities/quran_settings.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class GetQuranSettingsUseCase
    implements UseCase<QuranSettingsEntity, NoParams> {
  final QuranRepository _quranRepository;

  GetQuranSettingsUseCase(this._quranRepository);

  @override
  Future<Either<Failure, QuranSettingsEntity>> call(NoParams params) async {
    return _quranRepository.getAppSettings();
  }
}
