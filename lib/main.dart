import 'libs.dart';

void main() {
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
      initialRoute: '/forums_list',
      routes: {
        '/sign_up': (context) => SignUp(),
        '/login': (context) => Login(),
        '/forums_list': (context) => ForumsList(),
        '/post_details': (context) => PostDetails(),
        '/about_us': (context) => AboutUs(),
      },
    ),
  );
}