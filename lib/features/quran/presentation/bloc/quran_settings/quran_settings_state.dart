part of 'quran_settings_bloc.dart';

sealed class QuranSettingsState extends Equatable {
  const QuranSettingsState();

  @override
  List<Object> get props => [];
}

final class QuranSettingsInitial extends QuranSettingsState {}

final class QuranSettingsLoadFailure extends QuranSettingsState {}

final class QuranSettingsLoadSuccess extends QuranSettingsState {
  const QuranSettingsLoadSuccess(this.settings);

  final QuranSettingsEntity settings;

  @override
  List<Object> get props => [settings];

  @override
  String toString() => 'QuranSettingsLoadSuccess { settings: $settings }';
}
