import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';
import 'package:quran_app/features/quran/domain/usecases/add_to_last_read.dart';
import 'package:quran_app/features/quran/domain/usecases/get_quran_last_read.dart';

part 'quran_last_read_event.dart';
part 'quran_last_read_state.dart';

class QuranLastReadBloc extends Bloc<QuranLastReadEvent, QuranLastReadState> {
  final AddToLastReadUseCase _addToLastReadUseCase;
  final GetQuranLastReadUseCase _getQuranLastReadUseCase;

  QuranLastReadBloc(this._addToLastReadUseCase, this._getQuranLastReadUseCase)
      : super(QuranLastReadInitial()) {
    on<QuranAddToLastRead>(onQuranAddToLastRead);
    on<QuranGetLastRead>(onQuranGetLastRead);
  }

  void onQuranAddToLastRead(
      QuranAddToLastRead event, Emitter<QuranLastReadState> emit) async {
    _addToLastReadUseCase(AddToLastReadParams(
      surah: event.surah,
      index: event.index,
      lastReadAyah: event.lastReadAyah,
    ));
    emit(QuranAddToLastReadSuccess());
  }

  void onQuranGetLastRead(
    QuranGetLastRead event,
    Emitter<QuranLastReadState> emit,
  ) async {
    final res = _getQuranLastReadUseCase();
    res.fold(
      (l) => emit(QuranLastReadLoadFailure(l.message)),
      (r) => emit(QuranLastReadLoadSuccess(r)),
    );
  }
}
