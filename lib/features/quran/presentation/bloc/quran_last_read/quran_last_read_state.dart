part of 'quran_last_read_bloc.dart';

sealed class QuranLastReadState extends Equatable {
  const QuranLastReadState();

  @override
  List<Object> get props => [];
}

final class QuranLastReadInitial extends QuranLastReadState {}

final class QuranAddToLastReadSuccess extends QuranLastReadState {}

final class QuranLastReadLoadSuccess extends QuranLastReadState {
  const QuranLastReadLoadSuccess(this.surah);

  final QuranListEntity surah;

  @override
  List<Object> get props => [surah];
}

final class QuranLastReadLoadFailure extends QuranLastReadState {
  const QuranLastReadLoadFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
