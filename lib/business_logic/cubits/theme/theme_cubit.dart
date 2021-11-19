import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '/utils/utils.dart';
import '/presentation/theme/theme.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> with HydratedMixin {
  ThemeCubit()
      : super(ThemeState(
            isDark: false,
            variant: ThemeVariant.light,
            themeData: themeVariantData[ThemeVariant.light]!));

  void changeTheme() {
    //  emit(state.variant == ThemeVariant.light ?  ThemeState(variant: ThemeVariant.dark, themeData: themeVariantData[ThemeVariant.dark]!) : ThemeState(variant: ThemeVariant.light, themeData: themeVariantData[ThemeVariant.light]!));
    emit(state.variant == ThemeVariant.light
        ? state.copyWith(
            isDark: true,
            variant: ThemeVariant.dark,
            themeData: themeVariantData[ThemeVariant.dark])
        : state.copyWith(
            isDark: false,
            variant: ThemeVariant.light,
            themeData: themeVariantData[ThemeVariant.light]));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
