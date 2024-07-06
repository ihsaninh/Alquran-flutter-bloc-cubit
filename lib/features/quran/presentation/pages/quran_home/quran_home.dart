import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quran_app/config/router/navigation_data.dart';
import 'package:quran_app/core/constants/dictionary.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_list/quran_list_bloc.dart';
import 'package:quran_app/features/quran/presentation/widgets/custom_appbar.dart';
import 'package:quran_app/features/quran/presentation/widgets/last_read.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_list_item.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      appBar: _buildAppBar(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
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
      actions: [
        IconButton(
          splashColor: Theme.of(context).colorScheme.secondaryContainer,
          onPressed: () {},
          icon: const Icon(LucideIcons.search),
        ),
      ],
    );
  }

  NavigationBar _buildBottomNavigationBar(BuildContext context) {
    return NavigationBar(
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
      elevation: 10.0,
      indicatorColor: Theme.of(context).colorScheme.surfaceContainerLow,
      shadowColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
    );
  }

  Widget _buildBody(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LastRead(),
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
                    child: ListView.builder(
                      itemCount: state.quranlist.length,
                      itemBuilder: (context, index) {
                        final quranList = state.quranlist[index];
                        return QuranListItem(quranList: quranList);
                      },
                    ),
                  ),
              };
            },
          ),
        ],
      ),
    );
  }
}
