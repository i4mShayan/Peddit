import 'libs.dart';

class AppDatas{

  ThemeMode themeMode=ThemeMode.dark;
  bool loggedIn = false;
  PageController pageController=PageController();
  int navigationSelectedIndex=0;
  Image defaultProfilePicture=Image.asset("assets/images/default_profile.png");
  Image defaultBackground=Image.asset("assets/images/default_background.png");


  AppDatas._();

  static final AppDatas _instance = AppDatas._();

  factory AppDatas() {
    return _instance;
  }

}