import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_tafsir/quran_tafsir_bloc.dart';
import 'package:quran_app/features/quran/presentation/widgets/bottom_sheet_header.dart';

class TafsirSheet extends StatefulWidget {
  final QuranAyahEntity quranAyah;

  const TafsirSheet({super.key, required this.quranAyah});

  @override
  State<TafsirSheet> createState() => _TafsirSheetState();
}

class _TafsirSheetState extends State<TafsirSheet> {
  @override
  void initState() {
    context
        .read<QuranTafsirBloc>()
        .add(GetQuranTafsir(id: widget.quranAyah.id.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: BottomSheetHeader(
                title:
                    'Tafsir ${widget.quranAyah.surah.latin.trim()} Ayat ${widget.quranAyah.ayah}',
              ),
            ),
            BlocBuilder<QuranTafsirBloc, QuranTafsirState>(
              builder: (context, state) {
                return switch (state) {
                  QuranTafsirInitial() => const SizedBox(),
                  QuranTafsirLoadInProgress() => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  QuranTafsirLoadFailure() => Center(
                      child: Text(state.error),
                    ),
                  QuranTafsirLoadSuccess() => Expanded(
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              16.0,
                              4.0,
                              16.0,
                              16.0,
                            ),
                            child: Text(
                              state.tafsir.tahlili,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    height: 2.0,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
