part of 'quran_settings_bloc.dart';

class QuranSettingsState extends Equatable {
  const QuranSettingsState(this.settings);

  final QuranSettingsEntity settings;

  @override
  List<Object> get props => [settings];

  @override
  String toString() => 'QuranSettingsState { settings: $settings }';
}
