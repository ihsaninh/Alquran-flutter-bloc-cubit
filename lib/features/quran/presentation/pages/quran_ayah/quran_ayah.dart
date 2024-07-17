import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_ayah/quran_ayah_bloc.dart';
import 'package:quran_app/features/quran/presentation/widgets/custom_appbar.dart';
import 'package:quran_app/features/quran/presentation/widgets/go_to_ayah_dialog.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_ayah_item.dart';
import 'package:quran_app/features/quran/presentation/widgets/settings_sheet.dart';
import 'package:quran_app/features/quran/presentation/widgets/surah_basmallah.dart';
import 'package:quran_app/features/quran/presentation/widgets/surah_info_card.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class QuranAyah extends StatefulWidget {
  final QuranListEntity surah;

  const QuranAyah({super.key, required this.surah});

  @override
  State<QuranAyah> createState() => _QuranAyahState();
}

class _QuranAyahState extends State<QuranAyah> {
  final ItemScrollController itemScrollController = ItemScrollController();
  String ayatText = '';

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
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: widget.surah.latin,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          LucideIcons.moveLeft,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        splashColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
      ),
      actions: [
        IconButton(
          onPressed: () => _buildDialog(context),
          icon: const Icon(Icons.low_priority_outlined),
          splashColor: Theme.of(context).colorScheme.secondaryContainer,
        ),
        IconButton(
          onPressed: () => _showSettingsSheet(context),
          icon: const Icon(LucideIcons.settings2),
          splashColor: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocListener<QuranAyahBloc, QuranAyahState>(
        listener: (context, state) {
          if (state is QuranAyahLoadSuccess) {
            if (widget.surah.lastReadAyah != null) {
              Future.delayed(const Duration(milliseconds: 300), () {
                itemScrollController.jumpTo(
                  index: widget.surah.lastReadAyah! + 1,
                );
              });
            }
          }
        },
        child: BlocBuilder<QuranAyahBloc, QuranAyahState>(
          builder: (context, state) {
            return _buildContent(context, state);
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, QuranAyahState state) {
    return switch (state) {
      QuranAyahInitial() => const SizedBox(),
      QuranAyahLoadInProgress() => _buildLoadingIndicator(),
      QuranAyahLoadSuccess() => _buildAyahList(context, state),
      QuranAyahLoadFailure() => _buildErrorState(state),
    };
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  Widget _buildErrorState(QuranAyahLoadFailure state) {
    return Center(
      child: Text(state.error),
    );
  }

  Widget _buildAyahList(BuildContext context, QuranAyahLoadSuccess state) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        padding: const EdgeInsets.only(top: 16.0),
        itemCount: state.ayahList.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SurahInfoCard(surah: widget.surah);
          } else if (index == 1) {
            return SurahBasmallah(surah: widget.surah);
          } else {
            final quranAyah = state.ayahList[index - 2];
            return QuranAyahItem(quranAyah: quranAyah, index: index - 2);
          }
        },
      ),
    );
  }

  void _showSettingsSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      builder: (BuildContext context) {
        return const SettingsSheet();
      },
    );
  }

  void _buildDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GoToAyahDialog(
          surah: widget.surah,
          onPressed: () => {
            Navigator.pop(context),
            Future.delayed(const Duration(milliseconds: 300), () {
              itemScrollController.scrollTo(
                index: int.parse(ayatText) + 1,
                duration: const Duration(milliseconds: 200),
              );
            })
          },
          onChanged: (val) => {
            setState(() {
              ayatText = val;
            })
          },
        );
      },
    );
  }
}
