import 'package:go_router/go_router.dart';
import 'package:quran_app/features/quran/presentation/pages/quran_ayah/quran_ayah.dart';
import 'package:quran_app/features/quran/presentation/pages/quran_home/quran_home.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const QuranHome(),
    ),
    GoRoute(
      path: '/quran-ayah/:surahId',
      builder: (context, state) => QuranAyah(
        surahId: state.pathParameters["surahId"]!,
        surahName: state.uri.queryParameters["surahName"]!,
      ),
    ),
  ],
);
