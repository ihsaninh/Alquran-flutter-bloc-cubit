part of 'quran_tafsir_bloc.dart';

sealed class QuranTafsirState extends Equatable {
  const QuranTafsirState();

  @override
  List<Object> get props => [];
}

class QuranTafsirInitial extends QuranTafsirState {}

class QuranTafsirLoadInProgress extends QuranTafsirState {}

final class QuranTafsirLoadFailure extends QuranTafsirState {
  const QuranTafsirLoadFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

final class QuranTafsirLoadSuccess extends QuranTafsirState {
  const QuranTafsirLoadSuccess(this.tafsir);

  final QuranTafsirEntity tafsir;

  @override
  List<Object> get props => [tafsir];
}
