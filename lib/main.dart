import 'libs.dart';
import 'package:flutter/services.dart';


void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));

  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(),
      builder: (context, _) {
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: provider.themeMode,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          initialRoute: Datas().currentUser == null
              ? 'login'
              : '/navigation_page',
          routes: {
            '/add_new_post_page': (context) => AddNewPostPage(),
            '/feed_page': (context) => FeedPage(),
            '/forums_page': (context) => ForumsPage(),
            '/navigation_page': (context) => NavigationPage(),
            '/saved_posts_page': (context) => SavedPostsPage(),
            '/setting_page': (context) => SettingsPage(),
            '/sign_up': (context) => SignUp(),
            '/login': (context) => Login(),
            '/forums_page': (context) => ForumsPage(),
            '/about_us': (context) => AboutUs(),
          },
        );
      }
    ),
  );
}