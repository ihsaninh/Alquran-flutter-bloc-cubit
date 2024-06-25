import 'package:hive/hive.dart';
import 'package:quran_app/features/quran/data/models/quran_settings.dart';

abstract interface class QuranSettingsDataSource {
  QuranSettingsModel loadQuranSettings();
  QuranSettingsModel setQuranSettings({
    required String key,
    required dynamic value,
  });
}

class QuranSettingsDataSourceImpl implements QuranSettingsDataSource {
  final Box box;
  QuranSettingsDataSourceImpl(this.box);

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
    };
    return updateFunctions[key]?.call(value) ?? settings;
  }
}
