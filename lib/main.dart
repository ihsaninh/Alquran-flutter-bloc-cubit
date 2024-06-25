import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/config/router/router_config.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_settings/quran_settings_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_ayah/quran_ayah_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_list/quran_list_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_tafsir/quran_tafsir_bloc.dart';
import 'package:quran_app/injection_container.dart';
import 'package:quran_app/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<QuranSettingsBloc>(
          create: (context) => locator()..add(const GetQuranSettings()),
        ),
        BlocProvider<QuranListBloc>(
          create: (context) => locator()..add(const GetQuranList()),
        ),
        BlocProvider<QuranAyahBloc>(
          create: (context) => locator(),
        ),
        BlocProvider<QuranTafsirBloc>(
          create: (context) => locator(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            },
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
