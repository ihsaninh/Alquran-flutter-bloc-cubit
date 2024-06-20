import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/config/router/navigation_data.dart';
import 'package:quran_app/core/constants/dictionary.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_list/quran_list_bloc.dart';
import 'package:quran_app/features/quran/presentation/widgets/appbar.dart';
import 'package:quran_app/features/quran/presentation/widgets/last_read_card.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_list_item.dart';
import 'package:quran_app/features/quran/presentation/widgets/section_title.dart';

class QuranHome extends StatefulWidget {
  const QuranHome({super.key});

  @override
  State<QuranHome> createState() => _QuranHomeState();
}

class _QuranHomeState extends State<QuranHome> {
  int currentPageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        title: Dictionary.appName,
        onMenuPressed: () => {},
        actions: [
          IconButton(
            splashColor: Theme.of(context).colorScheme.secondaryContainer,
            onPressed: () => {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: navigationItems
            .map(
              (item) => NavigationDestination(
                icon: Icon(item.icon),
                label: item.label,
              ),
            )
            .toList(),
        selectedIndex: currentPageIndex,
        onDestinationSelected: _onItemTapped,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: Dictionary.lastRead),
              const SizedBox(height: 16.0),
              const LastReadCard(),
              const SizedBox(height: 16.0),
              BlocBuilder<QuranListBloc, QuranListState>(
                builder: (context, state) {
                  return switch (state) {
                    QuranListInitial() => const SizedBox(),
                    QuranListLoadInProgress() => const Expanded(
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                    QuranListLoadFailure() => Center(
                        child: Text(state.error),
                      ),
                    QuranListLoadSuccess() => Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            height: 1,
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
                          ),
                          itemCount: state.quranlist.length,
                          itemBuilder: (context, index) {
                            final quranList = state.quranlist[index];
                            return QuranListItem(
                              quranListEntity: quranList,
                            );
                          },
                        ),
                      ),
                  };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
