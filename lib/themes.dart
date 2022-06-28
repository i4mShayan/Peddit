import 'libs.dart';

class Themes{
  static final lightTheme = ThemeData(
    // fontFamily: 'Verdana',
    scaffoldBackgroundColor: Colors.blueGrey[50],
    backgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(color: Colors.white, elevation: 1),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: Colors.black,),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    // fontFamily: 'Verdana',
    scaffoldBackgroundColor: Colors.grey.shade900,
    backgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(color: Colors.grey.shade900, elevation: 2),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: Colors.white, backgroundColor: Colors.grey.shade900),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.grey.shade800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
    ),
  );
}