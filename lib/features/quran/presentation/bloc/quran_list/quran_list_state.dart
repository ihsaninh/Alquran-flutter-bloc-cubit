part of 'quran_list_bloc.dart';

sealed class QuranListState extends Equatable {
  const QuranListState();

  @override
  List<Object> get props => [];
}

class QuranListInitial extends QuranListState {}

class QuranListLoadInProgress extends QuranListState {}

final class QuranListLoadFailure extends QuranListState {
  const QuranListLoadFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

final class QuranListLoadSuccess extends QuranListState {
  const QuranListLoadSuccess(this.quranlist);

  final List<QuranListEntity> quranlist;

  @override
  List<Object> get props => [quranlist];
}
