import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_ayah/quran_ayah_bloc.dart';
import 'package:quran_app/features/quran/presentation/widgets/custom_appbar.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_ayah_item.dart';
import 'package:quran_app/features/quran/presentation/widgets/settings_sheet.dart';
import 'package:quran_app/features/quran/presentation/widgets/surah_basmallah.dart';
import 'package:quran_app/features/quran/presentation/widgets/surah_info_card.dart';

class QuranAyah extends StatefulWidget {
  final QuranListEntity surah;

  const QuranAyah({super.key, required this.surah});

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
      child: BlocBuilder<QuranAyahBloc, QuranAyahState>(
        builder: (context, state) {
          return _buildContent(context, state);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, QuranAyahState state) {
    if (state is QuranAyahLoadInProgress) {
      return _buildLoadingIndicator();
    } else if (state is QuranAyahLoadFailure) {
      return _buildErrorState(state);
    } else if (state is QuranAyahLoadSuccess) {
      return _buildAyahList(context, state);
    } else {
      return const SizedBox();
    }
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
                  return QuranAyahItem(quranAyah: quranAyah, index: index);
                },
              ),
            ),
          ],
        ),
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
}
