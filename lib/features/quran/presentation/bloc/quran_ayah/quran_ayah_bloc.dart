import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/domain/usecases/get_surah_ayah.dart';

part 'quran_ayah_event.dart';
part 'quran_ayah_state.dart';

class QuranAyahBloc extends Bloc<QuranAyahEvent, QuranAyahState> {
  final GetQuranAyahUseCase _getQuranAyahUseCase;

  QuranAyahBloc(
    this._getQuranAyahUseCase,
  ) : super(QuranAyahInitial()) {
    on<GetAyahList>(onGetAyahList);
  }

  Future<void> onGetAyahList(
      GetAyahList event, Emitter<QuranAyahState> emit) async {
    emit(QuranAyahLoadInProgress());

    final res =
        await _getQuranAyahUseCase(SurahAyahParams(surahId: event.surahId));

    res.fold(
      (l) => emit(QuranAyahLoadFailure(l.message)),
      (r) => emit(QuranAyahLoadSuccess(r)),
    );
  }
}
