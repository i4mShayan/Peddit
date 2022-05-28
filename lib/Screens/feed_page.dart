import '/libs.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {


  List<PostModel> posts = [
    new PostModel("title", "Description",
        new UserModel("TestUser", "pm@oamsdka.com", [], [], [] , [] , [] , [] , [] , [] , [], Image.asset('assets/images/logo/google.png')),
        new ForumModel(new UserModel("TestUser", "pm@oamsdka.com", [], [], [] , [] , [] , [] , [] , [] , [], Image.asset('assets/images/logo/google.png')), [], [], [], "Testforum", "forumDesc" , DateTime.now()),
        DateTime.now(), false, [] , [] , [] , Image.asset('assets/images/logo/google.png')),
    new PostModel("title", "Description",
        new UserModel("TestUser", "pm@oamsdka.com", [], [], [] , [] , [] , [] , [] , [] , [], Image.asset('assets/images/logo/google.png')),
        new ForumModel(new UserModel("TestUser", "pm@oamsdka.com", [], [], [] , [] , [] , [] , [] , [] , [], Image.asset('assets/images/logo/google.png')), [], [], [], "Testforum", "forumDesc" , DateTime.now()),
        DateTime.now(), false, [] , [] , [] , Image.asset('assets/images/logo/google.png')),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false,

      // Feed Body(Posts)
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (contex, index) {
            return PostItem(post: posts[index]);
          }),
    );
  }
}
