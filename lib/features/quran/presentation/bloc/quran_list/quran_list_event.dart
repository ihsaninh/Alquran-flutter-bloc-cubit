part of 'quran_list_bloc.dart';

sealed class QuranListEvent {
  const QuranListEvent();
}

class GetQuranList extends QuranListEvent {
  const GetQuranList();
}
