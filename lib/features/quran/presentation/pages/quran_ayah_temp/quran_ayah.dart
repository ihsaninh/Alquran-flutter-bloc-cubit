import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/models/basmallah.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_ayah/quran_ayah_bloc.dart';

class QuranAyahTemp extends StatefulWidget {
  final String surahId;
  final String surahName;

  const QuranAyahTemp({
    super.key,
    required this.surahId,
    required this.surahName,
  });

  @override
  State<QuranAyahTemp> createState() => _QuranAyahTempState();
}

class _QuranAyahTempState extends State<QuranAyahTemp> {
  @override
  void initState() {
    context.read<QuranAyahBloc>().add(GetAyahList(surahId: widget.surahId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surahName),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<QuranAyahBloc, QuranAyahState>(
      listener: (context, state) {
        if (state is QuranAyahLoadFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        return switch (state) {
          QuranAyahInitial() => const SizedBox(),
          QuranAyahLoadInProgress() => const Center(
              child: CupertinoActivityIndicator(),
            ),
          QuranAyahLoadFailure() => const SizedBox(),
          QuranAyahLoadSuccess() => RefreshIndicator(
              onRefresh: () async {},
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: _buildBasmallah(),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final int itemIndex = index ~/ 2;
                        if (index.isEven) {
                          final quranAyah = state.ayahList[itemIndex];
                          return buildListTile(quranAyah);
                        } else {
                          return const Divider();
                        }
                      },
                      semanticIndexCallback: (Widget widget, int localIndex) {
                        if (localIndex.isEven) {
                          return localIndex ~/ 2;
                        }
                        return null;
                      },
                      childCount: math.max(0, state.ayahList.length * 2 - 1),
                    ),
                  )
                ],
              ),
            ),
        };
      },
    );
  }

  Widget _buildBasmallah() {
    if (widget.surahId == "1" || widget.surahId == "9") return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Text(
            basmallah.ayatArab,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'LPMQ',
              fontSize: 30,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget buildListTile(QuranAyahEntity quranAyah) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            quranAyah.ayah.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
      title: Text(
        quranAyah.arabic,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontFamily: 'LPMQ',
          fontSize: 27.0,
          height: 2.1,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Text(
          quranAyah.translation,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            height: 2,
          ),
        ),
      ),
      onTap: () => {},
    );
  }
}
