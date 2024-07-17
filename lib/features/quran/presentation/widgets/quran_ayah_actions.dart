import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quran_app/core/constants/dictionary.dart';
import 'package:quran_app/features/quran/domain/entities/quran_ayah.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_last_read/quran_last_read_bloc.dart';
import 'package:quran_app/features/quran/presentation/widgets/tafsir_sheet.dart';
import 'package:share_plus/share_plus.dart';

enum MoreItems { share, lastRead }

class QuranAyahActions extends StatelessWidget {
  final QuranAyahEntity quranAyah;
  final int index;

  const QuranAyahActions({
    super.key,
    required this.quranAyah,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAyahText(context),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAyahText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        quranAyah.ayah.toString(),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
          context,
          tooltip: Dictionary.copyAyat,
          icon: LucideIcons.copy,
          onPressed: () => _copyAyahToClipboard(context),
        ),
        _buildIconButton(
          context,
          tooltip: Dictionary.saveBookmark,
          icon: LucideIcons.bookmark,
          onPressed: () {}, // Add functionality here
        ),
        _buildIconButton(
          context,
          tooltip: Dictionary.showTafsir,
          icon: LucideIcons.bookOpen,
          onPressed: () => _showTafsir(context, quranAyah),
        ),
        _moreActions(context),
      ],
    );
  }

  Widget _buildIconButton(
    BuildContext context, {
    required String tooltip,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(icon, size: 22.0),
    );
  }

  void _copyAyahToClipboard(BuildContext context) {
    Clipboard.setData(
      ClipboardData(
        text:
            "${quranAyah.arabic}\n${quranAyah.translation} [${quranAyah.surahId}]:${quranAyah.ayah}",
      ),
    ).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ayat sudah disalin ke clipboard'),
        ),
      );
    });
  }

  Future<void> _showTafsir(BuildContext context, QuranAyahEntity quranAyah) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      builder: (BuildContext context) {
        return TafsirSheet(quranAyah: quranAyah);
      },
    );
  }

  PopupMenuButton<MoreItems> _moreActions(BuildContext context) {
    return PopupMenuButton<MoreItems>(
      tooltip: Dictionary.moreActions,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      icon: Icon(
        LucideIcons.circleEllipsis,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        size: 22.0,
      ),
      popUpAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 400),
      ),
      elevation: 1.0,
      offset: const Offset(0.0, 56.0),
      onSelected: (MoreItems item) => _handleMenuItemSelected(context, item),
      itemBuilder: (BuildContext context) => _buildPopupMenuItems(),
    );
  }

  List<PopupMenuItem<MoreItems>> _buildPopupMenuItems() {
    return [
      _buildPopupMenuItem(
          MoreItems.lastRead, LucideIcons.paperclip, 'Tandai terakhir baca'),
      _buildPopupMenuItem(MoreItems.share, LucideIcons.share2, 'Bagikan Ayat'),
    ];
  }

  PopupMenuItem<MoreItems> _buildPopupMenuItem(
    MoreItems value,
    IconData icon,
    String text,
  ) {
    return PopupMenuItem<MoreItems>(
      value: value,
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
      ),
    );
  }

  void _handleMenuItemSelected(BuildContext context, MoreItems item) {
    if (item == MoreItems.lastRead) {
      QuranLastReadBloc bloc = context.read<QuranLastReadBloc>();
      bloc.add(QuranAddToLastRead(
          surah: quranAyah.surah, index: index, lastReadAyah: quranAyah.ayah));
      bloc.add(const QuranGetLastRead());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ayat berhasil ditandai sebagai terakhir baca'),
        ),
      );
    } else if (item == MoreItems.share) {
      Share.share(
        "${quranAyah.arabic}\n${quranAyah.translation} [${quranAyah.surahId}]:${quranAyah.ayah}",
        subject: 'Bagikan ayat',
      );
    }
  }
}
