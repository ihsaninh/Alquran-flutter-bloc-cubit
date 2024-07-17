import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quran_app/core/constants/dictionary.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_list/quran_list_bloc.dart';
import 'package:quran_app/features/quran/presentation/widgets/custom_appbar.dart';
import 'package:quran_app/features/quran/presentation/widgets/last_read.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_list_item.dart';

class QuranHome extends StatelessWidget {
  const QuranHome({super.key});

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
      centerTitle: true,
      title: Dictionary.appName,
      leading: IconButton(
        icon: const Icon(LucideIcons.alignLeft),
        splashColor: Theme.of(context).colorScheme.secondaryContainer,
        onPressed: () {},
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LastRead(),
        _buildTabView(context),
      ],
    );
  }

  Widget _buildTabView(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TabBar(
                padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                dividerHeight: 0.0,
                tabs: [
                  Tab(text: Dictionary.surahTabs),
                  Tab(text: Dictionary.bookmarkTabs),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2.0,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildSurahList(context),
                    const Center(
                      child: Text(Dictionary.bookmarkEmpty),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSurahList(BuildContext context) {
    return BlocBuilder<QuranListBloc, QuranListState>(
      builder: (context, state) {
        return switch (state) {
          QuranListInitial() => const SizedBox(),
          QuranListLoadInProgress() => const Center(
              child: CupertinoActivityIndicator(),
            ),
          QuranListLoadFailure() => Center(
              child: Text(state.error),
            ),
          QuranListLoadSuccess() => RefreshIndicator(
              onRefresh: () async {},
              child: ListView.builder(
                itemCount: state.quranlist.length,
                itemBuilder: (context, index) {
                  final quranList = state.quranlist[index];
                  return QuranListItem(
                    quranList: quranList,
                  );
                },
              ),
            ),
        };
      },
    );
  }
}
