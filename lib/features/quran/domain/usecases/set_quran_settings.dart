import 'package:quran_app/features/quran/domain/entities/quran_settings.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class SetQuranSettingsUseCase {
  final QuranRepository _quranRepository;

  SetQuranSettingsUseCase(this._quranRepository);

  QuranSettingsEntity call(SetAppSettingsParams params) {
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
