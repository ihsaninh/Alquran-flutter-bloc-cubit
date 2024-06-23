part of 'quran_tafsir_bloc.dart';

sealed class QuranTafsirEvent extends Equatable {
  const QuranTafsirEvent();
}

final class GetQuranTafsir extends QuranTafsirEvent {
  const GetQuranTafsir({required this.id});

  final String id;

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'GetQuranTafsir(id: $id)';
}
