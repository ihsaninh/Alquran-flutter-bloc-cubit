import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants/dictionary.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_last_read/quran_last_read_bloc.dart';
import 'package:quran_app/features/quran/presentation/widgets/section_title.dart';

class LastRead extends StatefulWidget {
  const LastRead({super.key});

  @override
  State<LastRead> createState() => _LastReadState();
}

class _LastReadState extends State<LastRead> {
  @override
  void initState() {
    context.read<QuranLastReadBloc>().add(const QuranGetLastRead());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranLastReadBloc, QuranLastReadState>(
      builder: (context, state) {
        if (state is QuranLastReadLoadSuccess) {
          return Column(
            children: [
              const SectionTitle(
                title: Dictionary.lastRead,
                padding: 16.0,
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card.filled(
                  color: Theme.of(context).colorScheme.surfaceContainerLow,
                  margin: EdgeInsets.zero,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.surah.latin,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "Ayat ${state.surah.lastReadAyah}",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant
                                      .withOpacity(0.7),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
