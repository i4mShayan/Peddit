import 'libs.dart';
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        primarySwatch: Colors.deepOrange,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      themeMode: ThemeMode.light,
      initialRoute: '/navigation_page',
      routes: {
        '/add_new_post_page': (context) => AddNewPostPage(),
        '/feed_page': (context) => FeedPage(),
        '/forums_page': (context) => ForumsPage(),
        '/navigation_page': (context) => NavigationPage(),
        '/saved_posts_page': (context) => SavedPostsPage(),
        '/setting_page': (context) => SettingPage(),
        '/single_forum_page': (context) => SingleForumPage(),
        '/sign_up': (context) => SignUp(),
        '/login': (context) => Login(),
        '/forums_page': (context) => ForumsPage(),
        '/post_details': (context) => PostDetails(),
        '/about_us': (context) => AboutUs(),
      },
    ),
  );
}