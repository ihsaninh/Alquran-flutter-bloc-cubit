import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quran_app/features/quran/data/data_sources/remote/quran_api_service.dart';
import 'package:quran_app/features/quran/data/repositories/quran_repository_impl.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';
import 'package:quran_app/features/quran/domain/usecases/get_quran_list.dart';
import 'package:quran_app/features/quran/domain/usecases/get_quran_tafsir.dart';
import 'package:quran_app/features/quran/domain/usecases/get_surah_ayah.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_ayah/quran_ayah_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_list/quran_list_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_tafsir/quran_tafsir_bloc.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  locator.registerLazySingleton<Dio>(() => Dio());

  // Dependencies
  locator.registerSingleton<QuranApiService>(QuranApiService(locator()));

  locator.registerSingleton<QuranRepository>(QuranRepositoryImpl(locator()));

  // UseCases
  locator
      .registerSingleton<GetQuranListUseCase>(GetQuranListUseCase(locator()));
  locator
      .registerSingleton<GetQuranAyahUseCase>(GetQuranAyahUseCase(locator()));
  locator.registerSingleton<GetQuranTafsirUseCase>(
      GetQuranTafsirUseCase(locator()));

  // Blocs
  locator.registerFactory<QuranListBloc>(() => QuranListBloc(locator()));
  locator.registerFactory<QuranAyahBloc>(() => QuranAyahBloc(locator()));
  locator.registerFactory<QuranTafsirBloc>(() => QuranTafsirBloc(locator()));
}
