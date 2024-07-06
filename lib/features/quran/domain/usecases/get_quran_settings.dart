import 'package:quran_app/core/usecase/usecase.dart';
import 'package:quran_app/features/quran/domain/entities/quran_settings.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class GetQuranSettingsUseCase {
  final QuranRepository _quranRepository;

  GetQuranSettingsUseCase(this._quranRepository);

  QuranSettingsEntity call(NoParams params) {
    return _quranRepository.getAppSettings();
  }
}
