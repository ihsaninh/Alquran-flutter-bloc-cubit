import 'package:quran_app/features/quran/domain/entities/quran_list.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';

class AddToLastReadUseCase {
  final QuranRepository _quranRepository;

  AddToLastReadUseCase(this._quranRepository);

  void call(AddToLastReadParams params) {
    return _quranRepository.addToLastRead(
      surah: params.surah,
      index: params.index,
      lastReadAyah: params.lastReadAyah,
    );
  }
}

class AddToLastReadParams {
  final QuranListEntity surah;
  final int index;
  final int lastReadAyah;

  AddToLastReadParams({
    required this.surah,
    required this.index,
    required this.lastReadAyah,
  });
}
