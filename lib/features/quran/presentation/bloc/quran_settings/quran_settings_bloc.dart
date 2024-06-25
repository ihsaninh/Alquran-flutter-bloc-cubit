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
  ) : super(QuranSettingsInitial()) {
    on<GetQuranSettings>(onGetAppSettings);
    on<SetQuranSettings>(onSetAppSettings);
  }

  Future<void> onGetAppSettings(
      GetQuranSettings event, Emitter<QuranSettingsState> emit) async {
    final res = await _getQuranSettingsUseCase(NoParams());

    res.fold(
      (l) => emit(QuranSettingsLoadFailure()),
      (r) => emit(QuranSettingsLoadSuccess(r)),
    );
  }

  Future<void> onSetAppSettings(
      SetQuranSettings event, Emitter<QuranSettingsState> emit) async {
    final res = await _setQuranSettingsUseCase(
        SetAppSettingsParams(key: event.key, value: event.value));
    res.fold(
      (l) => emit(QuranSettingsLoadFailure()),
      (r) => emit(QuranSettingsLoadSuccess(r)),
    );
  }
}
