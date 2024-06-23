import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/features/quran/domain/entities/quran_tafsir.dart';
import 'package:quran_app/features/quran/domain/usecases/get_quran_tafsir.dart';

part 'quran_tafsir_event.dart';
part 'quran_tafsir_state.dart';

class QuranTafsirBloc extends Bloc<QuranTafsirEvent, QuranTafsirState> {
  final GetQuranTafsirUseCase _getQuranTafsirUseCase;

  QuranTafsirBloc(this._getQuranTafsirUseCase) : super(QuranTafsirInitial()) {
    on<GetQuranTafsir>(onGetQuranTafsir);
  }

  Future<void> onGetQuranTafsir(
      GetQuranTafsir event, Emitter<QuranTafsirState> emit) async {
    emit(QuranTafsirLoadInProgress());

    final res = await _getQuranTafsirUseCase(SurahTafsirParams(id: event.id));

    res.fold(
      (l) => emit(QuranTafsirLoadFailure(l.message)),
      (r) => emit(QuranTafsirLoadSuccess(r)),
    );
  }
}
