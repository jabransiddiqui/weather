import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/presentation/presentation.dart';

import '/utils/utils.dart';

class ThemeState extends Equatable {
  final bool isDark;
  final ThemeData themeData;
  final ThemeVariant variant;
  const ThemeState(
      {required this.isDark, required this.variant, required this.themeData});

  ThemeState copyWith({
    bool? isDark,
    ThemeData? themeData,
    ThemeVariant? variant,
  }) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
      themeData: themeData ?? this.themeData,
      variant: variant ?? this.variant,
    );
  }

  @override
  List<Object?> get props => [isDark, themeData, variant];

  Map<String, dynamic> toMap() {
    return {
      'isDark': isDark,
      'variant': variant.index,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      isDark: map['isDark'],
      themeData: map["variant"] == 0
          ? themeVariantData[ThemeVariant.light]!
          : themeVariantData[ThemeVariant.dark]!,
      variant: map["variant"] == 0 ? ThemeVariant.light : ThemeVariant.dark,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeState.fromJson(String source) =>
      ThemeState.fromMap(json.decode(source));
}
