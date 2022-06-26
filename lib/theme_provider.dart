import 'libs.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode==ThemeMode.dark;

  void toggleTheme(bool darkMode){
    themeMode = darkMode ? ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
}