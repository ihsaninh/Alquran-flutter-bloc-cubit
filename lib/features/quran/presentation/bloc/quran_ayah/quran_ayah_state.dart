part of 'quran_ayah_bloc.dart';

sealed class QuranAyahState extends Equatable {
  const QuranAyahState();

  @override
  List<Object> get props => [];
}

class QuranAyahInitial extends QuranAyahState {}

class QuranAyahLoadInProgress extends QuranAyahState {}

final class QuranAyahLoadFailure extends QuranAyahState {
  const QuranAyahLoadFailure(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

final class QuranAyahLoadSuccess extends QuranAyahState {
  const QuranAyahLoadSuccess(this.ayahList);

  final List<QuranAyahEntity> ayahList;

  @override
  List<Object> get props => [ayahList];
}
