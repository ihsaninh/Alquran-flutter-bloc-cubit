part of 'quran_settings_bloc.dart';

sealed class QuranSettingsEvent extends Equatable {
  const QuranSettingsEvent();

  @override
  List<Object> get props => [];
}

class GetQuranSettings extends QuranSettingsEvent {
  const GetQuranSettings();
}

class SetQuranSettings extends QuranSettingsEvent {
  const SetQuranSettings({required this.key, required this.value});

  final String key;
  final dynamic value;

  @override
  List<Object> get props => [key, value];

  @override
  String toString() => 'SetQuranSettings(key: $key, value: $value)';
}
