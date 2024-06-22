import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_ayah/quran_ayah_bloc.dart';
import 'package:quran_app/features/quran/presentation/widgets/custom_appbar.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_ayah_item.dart';
import 'package:quran_app/features/quran/presentation/widgets/settings_sheet.dart';
import 'package:quran_app/features/quran/presentation/widgets/surah_basmallah.dart';
import 'package:quran_app/features/quran/presentation/widgets/surah_info_card.dart';

class QuranAyah extends StatefulWidget {
  final QuranListEntity surah;

  const QuranAyah({
    super.key,
    required this.surah,
  });

  @override
  State<QuranAyah> createState() => _QuranAyahState();
}

class _QuranAyahState extends State<QuranAyah> {
  @override
  void initState() {
    super.initState();
    context
        .read<QuranAyahBloc>()
        .add(GetAyahList(surahId: widget.surah.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        title: widget.surah.latin,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: IconButton(
            splashColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        actions: [
          IconButton(
            splashColor: Theme.of(context).colorScheme.secondaryContainer,
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Theme.of(context).colorScheme.surface,
              builder: (BuildContext context) {
                return const SettingsSheet();
              },
            ),
            icon: const Icon(Icons.tune_rounded),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        color: Theme.of(context).colorScheme.surface,
        child: BlocBuilder<QuranAyahBloc, QuranAyahState>(
          builder: (context, state) {
            return switch (state) {
              QuranAyahInitial() => const SizedBox(),
              QuranAyahLoadInProgress() => const Center(
                  child: CupertinoActivityIndicator(),
                ),
              QuranAyahLoadFailure() => Center(
                  child: Text(state.error),
                ),
              QuranAyahLoadSuccess() => RefreshIndicator(
                  onRefresh: () async {},
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SurahInfoCard(surah: widget.surah),
                        SurahBasmallah(surah: widget.surah),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.ayahList.length,
                            itemBuilder: (context, index) {
                              final quranAyah = state.ayahList[index];
                              return QuranAyahItem(
                                quranAyah: quranAyah,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            };
          },
        ),
      ),
    );
  }
}
