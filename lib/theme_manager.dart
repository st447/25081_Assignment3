import 'package:flutter/material.dart';

class ThemeModeManager extends InheritedWidget {
  final ThemeMode themeMode;
  final Function(ThemeMode) setThemeMode;

  const ThemeModeManager({
    Key? key,
    required Widget child,
    required this.themeMode,
    required this.setThemeMode,
  }) : super(key: key, child: child);

  static ThemeModeManager of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeModeManager>()!;
  }

  @override
  bool updateShouldNotify(ThemeModeManager oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
