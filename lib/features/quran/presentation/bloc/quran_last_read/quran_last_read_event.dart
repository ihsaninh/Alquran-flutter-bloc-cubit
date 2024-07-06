part of 'quran_last_read_bloc.dart';

sealed class QuranLastReadEvent extends Equatable {
  const QuranLastReadEvent();

  @override
  List<Object> get props => [];
}

class QuranAddToLastRead extends QuranLastReadEvent {
  const QuranAddToLastRead({
    required this.surah,
    required this.index,
    required this.lastReadAyah,
  });

  final QuranListEntity surah;
  final int index;
  final int lastReadAyah;

  @override
  List<Object> get props => [surah, index, lastReadAyah];
}

class QuranGetLastRead extends QuranLastReadEvent {
  const QuranGetLastRead();
}
