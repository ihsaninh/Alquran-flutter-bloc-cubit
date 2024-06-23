import 'package:equatable/equatable.dart';

class QuranTafsirEntity extends Equatable {
  final String wajiz;
  final String tahlili;

  const QuranTafsirEntity({
    required this.wajiz,
    required this.tahlili,
  });

  @override
  List<Object> get props {
    return [
      wajiz,
      tahlili,
    ];
  }
}
