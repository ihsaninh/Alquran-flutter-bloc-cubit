import 'package:hive/hive.dart';
import 'package:quran_app/features/quran/data/models/quran_list.dart';
import 'package:quran_app/features/quran/data/models/quran_settings.dart';
import 'package:quran_app/features/quran/domain/entities/quran_list.dart';

abstract interface class QuranLocalDataSource {
  QuranSettingsModel loadQuranSettings();
  QuranSettingsModel setQuranSettings({
    required String key,
    required dynamic value,
  });
  void addToLastRead(QuranListEntity quranModel, int index, int lastReadAyah);
  QuranListModel? getLastRead();
}

class QuranLocalDataSourceImpl implements QuranLocalDataSource {
  final Box box;
  QuranLocalDataSourceImpl(this.box);

  @override
  QuranSettingsModel loadQuranSettings() {
    if (_settingsExist()) {
      return _getQuranSettings();
    } else {
      return _initializeDefaultSettings();
    }
  }

  bool _settingsExist() {
    return box.containsKey('settings');
  }

  QuranSettingsModel _getQuranSettings() {
    return QuranSettingsModel.fromJson(box.get('settings'));
  }

  QuranSettingsModel _initializeDefaultSettings() {
    const defaultSettings = QuranSettingsModel(
      showArabic: true,
      showTranslation: true,
      showLatin: true,
      showFootnotes: false,
      arabicFontSize: 32.0,
      latinFontSize: 14.0,
    );

    box.put('settings', defaultSettings.toJson());
    return _getQuranSettings();
  }

  @override
  QuranSettingsModel setQuranSettings({
    required String key,
    required dynamic value,
  }) {
    final settings = _getQuranSettings();

    final updatedSettings = _updateSettings(settings, key, value);

    box.put('settings', updatedSettings.toJson());
    return _getQuranSettings();
  }

  QuranSettingsModel _updateSettings(
    QuranSettingsModel settings,
    String key,
    dynamic value,
  ) {
    final Map<String, QuranSettingsModel Function(dynamic)> updateFunctions = {
      'showArabic': (value) => settings.copyWith(showArabic: value),
      'showTranslation': (value) => settings.copyWith(showTranslation: value),
      'showLatin': (value) => settings.copyWith(showLatin: value),
      'showFootnotes': (value) => settings.copyWith(showFootnotes: value),
      'arabicFontSize': (value) => settings.copyWith(arabicFontSize: value),
      'latinFontSize': (value) => settings.copyWith(latinFontSize: value),
    };
    return updateFunctions[key]?.call(value) ?? settings;
  }

  @override
  void addToLastRead(QuranListEntity quranModel, int index, int lastReadAyah) {
    final QuranListModel lastRead = QuranListModel(
      id: quranModel.id,
      arabic: quranModel.arabic,
      latin: quranModel.latin,
      transliteration: quranModel.transliteration,
      translation: quranModel.translation,
      numAyah: quranModel.numAyah,
      page: quranModel.page,
      location: quranModel.location,
      index: index,
      lastReadAyah: lastReadAyah,
      createdAt: DateTime.now(),
    );
    box.put('lastRead', lastRead.toJson());
  }

  @override
  QuranListModel? getLastRead() {
    final lastRead = box.get('lastRead');
    if (lastRead != null) {
      return QuranListModel.fromJson(lastRead);
    }
    return null;
  }
}
