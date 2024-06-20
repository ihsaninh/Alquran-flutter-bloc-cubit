part of 'quran_ayah_bloc.dart';

sealed class QuranAyahEvent extends Equatable {
  const QuranAyahEvent();
}

final class GetAyahList extends QuranAyahEvent {
  const GetAyahList({required this.surahId});

  final String surahId;

  @override
  List<Object> get props => [surahId];

  @override
  String toString() => 'GetAyahList(surahId: $surahId)';
}
