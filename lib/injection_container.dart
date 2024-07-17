import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/features/quran/data/data_sources/local/quran_local_data_source.dart';
import 'package:quran_app/features/quran/data/data_sources/remote/quran_api_service.dart';
import 'package:quran_app/features/quran/data/repositories/quran_repository_impl.dart';
import 'package:quran_app/features/quran/domain/repositories/quran_repository.dart';
import 'package:quran_app/features/quran/domain/usecases/add_to_last_read.dart';
import 'package:quran_app/features/quran/domain/usecases/get_quran_last_read.dart';
import 'package:quran_app/features/quran/domain/usecases/get_quran_settings.dart';
import 'package:quran_app/features/quran/domain/usecases/get_quran_list.dart';
import 'package:quran_app/features/quran/domain/usecases/get_quran_tafsir.dart';
import 'package:quran_app/features/quran/domain/usecases/get_surah_ayah.dart';
import 'package:quran_app/features/quran/domain/usecases/set_quran_settings.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_last_read/quran_last_read_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_settings/quran_settings_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_ayah/quran_ayah_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_list/quran_list_bloc.dart';
import 'package:quran_app/features/quran/presentation/bloc/quran_tafsir/quran_tafsir_bloc.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  //Hive
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  locator.registerLazySingleton(
    () => Hive.box(name: 'quran'),
  );

  // Dio
  locator.registerLazySingleton<Dio>(() => Dio());

  // Data
  locator.registerSingleton<QuranApiService>(QuranApiService(locator()));
  locator.registerSingleton<QuranLocalDataSource>(
      QuranLocalDataSourceImpl(locator()));

  locator.registerSingleton<QuranRepository>(
      QuranRepositoryImpl(locator(), locator()));

  // UseCases
  locator
      .registerSingleton<GetQuranListUseCase>(GetQuranListUseCase(locator()));
  locator
      .registerSingleton<GetQuranAyahUseCase>(GetQuranAyahUseCase(locator()));
  locator.registerSingleton<GetQuranTafsirUseCase>(
      GetQuranTafsirUseCase(locator()));
  locator.registerSingleton<GetQuranSettingsUseCase>(
      GetQuranSettingsUseCase(locator()));
  locator.registerSingleton<SetQuranSettingsUseCase>(
      SetQuranSettingsUseCase(locator()));
  locator
      .registerSingleton<AddToLastReadUseCase>(AddToLastReadUseCase(locator()));
  locator.registerSingleton<GetQuranLastReadUseCase>(
      GetQuranLastReadUseCase(locator()));

  // Blocs
  locator.registerFactory<QuranListBloc>(() => QuranListBloc(locator()));
  locator.registerFactory<QuranAyahBloc>(() => QuranAyahBloc(locator()));
  locator.registerFactory<QuranTafsirBloc>(() => QuranTafsirBloc(locator()));
  locator.registerFactory<QuranSettingsBloc>(
      () => QuranSettingsBloc(locator(), locator()));
  locator.registerFactory<QuranLastReadBloc>(
      () => QuranLastReadBloc(locator(), locator()));
}
