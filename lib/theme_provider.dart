import 'package:flutter/scheduler.dart';
import 'libs.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = SchedulerBinding.instance.window.platformBrightness==Brightness.dark ? ThemeMode.dark:ThemeMode.light;

  bool get isDarkMode => themeMode==ThemeMode.dark;

  void toggleTheme(bool darkMode){
    themeMode = darkMode ? ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
}