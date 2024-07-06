import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/core/usecase/usecase.dart';
import 'package:quran_app/features/quran/domain/entities/quran_settings.dart';
import 'package:quran_app/features/quran/domain/usecases/get_quran_settings.dart';
import 'package:quran_app/features/quran/domain/usecases/set_quran_settings.dart';

part 'quran_settings_event.dart';
part 'quran_settings_state.dart';

class QuranSettingsBloc extends Bloc<QuranSettingsEvent, QuranSettingsState> {
  final GetQuranSettingsUseCase _getQuranSettingsUseCase;
  final SetQuranSettingsUseCase _setQuranSettingsUseCase;

  QuranSettingsBloc(
    this._getQuranSettingsUseCase,
    this._setQuranSettingsUseCase,
  ) : super(const QuranSettingsState(QuranSettingsEntity(
          showArabic: false,
          showTranslation: false,
          showLatin: false,
          showFootnotes: false,
          arabicFontSize: 32,
          latinFontSize: 14,
        ))) {
    on<GetQuranSettings>(onGetAppSettings);
    on<SetQuranSettings>(onSetAppSettings);
  }

  void onGetAppSettings(
    GetQuranSettings event,
    Emitter<QuranSettingsState> emit,
  ) {
    final res = _getQuranSettingsUseCase(NoParams());
    emit(QuranSettingsState(res));
  }

  void onSetAppSettings(
    SetQuranSettings event,
    Emitter<QuranSettingsState> emit,
  ) {
    final res = _setQuranSettingsUseCase(SetAppSettingsParams(
      key: event.key,
      value: event.value,
    ));
    emit(QuranSettingsState(res));
  }
}
