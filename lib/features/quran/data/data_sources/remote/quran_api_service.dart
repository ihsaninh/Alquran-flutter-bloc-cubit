import 'package:quran_app/core/constants/constants.dart';
import 'package:quran_app/features/quran/data/models/quran_ayah.dart';
import 'package:quran_app/features/quran/data/models/quran_list.dart';
import 'package:quran_app/features/quran/data/models/quran_tafsir.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'quran_api_service.g.dart';

@RestApi(baseUrl: AppConstants.quranAPIBaseURL)
abstract class QuranApiService {
  factory QuranApiService(Dio dio, {String baseUrl}) = _QuranApiService;

  @GET('/quran-surah')
  Future<HttpResponse<List<QuranListModel>>> getSurahList();

  @GET('/quran-ayah')
  Future<HttpResponse<List<QuranAyahModel>>> getSurahAyah(
    @Query('surah') String surahId,
  );

  @GET('/quran-tafsir/{id}')
  Future<HttpResponse<QuranTafsirModel>> getSurahTafsir(@Path() String id);
}
