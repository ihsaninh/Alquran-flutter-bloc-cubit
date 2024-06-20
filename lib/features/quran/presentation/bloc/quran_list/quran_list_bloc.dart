import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/usecase/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';
import 'package:quran_app/features/quran/domain/usecases/get_quran_list.dart';

part 'quran_list_event.dart';
part 'quran_list_state.dart';

class QuranListBloc extends Bloc<QuranListEvent, QuranListState> {
  final GetQuranListUseCase _getQuranListUseCase;

  QuranListBloc(this._getQuranListUseCase) : super(QuranListInitial()) {
    on<GetQuranList>(onGetQuranList);
  }

  Future<void> onGetQuranList(
      GetQuranList event, Emitter<QuranListState> emit) async {
    emit(QuranListLoadInProgress());

    final res = await _getQuranListUseCase(NoParams());

    res.fold(
      (l) => emit(QuranListLoadFailure(l.message)),
      (r) => emit(QuranListLoadSuccess(r)),
    );
  }
}
