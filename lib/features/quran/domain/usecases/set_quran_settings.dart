import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/errors/failures.dart';
import 'package:quran_app/core/usecase/usecase.dart';
import 'package:quran_app/features/quran/domain/entities/quran_settings.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class SetQuranSettingsUseCase
    implements UseCase<QuranSettingsEntity, SetAppSettingsParams> {
  final QuranRepository _quranRepository;

  SetQuranSettingsUseCase(this._quranRepository);

  @override
  Future<Either<Failure, QuranSettingsEntity>> call(
      SetAppSettingsParams params) async {
    return _quranRepository.setAppSettings(
      key: params.key,
      value: params.value,
    );
  }
}

class SetAppSettingsParams {
  final String key;
  final dynamic value;

  SetAppSettingsParams({
    required this.key,
    required this.value,
  });
}
