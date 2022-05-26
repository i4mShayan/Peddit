import '/libs.dart';

class SavedPostsPage extends StatefulWidget {
  const SavedPostsPage({Key? key}) : super(key: key);

  @override
  State<SavedPostsPage> createState() => _SavedPostsPageState();
}

class _SavedPostsPageState extends State<SavedPostsPage> {

  List<PostModel> posts = [
    new PostModel("title", "Description",
        new UserModel("TestUser", "pm@oamsdka.com", [], [], [] , [] , [] , [] , [] , [] , Image.asset('assets/images/logo/google.png')),
        new ForumModel(new UserModel("TestUser", "pm@oamsdka.com", [], [], [] , [] , [] , [] , [] , [] , Image.asset('assets/images/logo/google.png')), [], [], [], "Testforum", "forumDesc" , DateTime.now()),
        DateTime.now(), false, [] , [] , [] , Image.asset('assets/images/logo/google.png')),
    new PostModel("title", "Description",
        new UserModel("TestUser", "pm@oamsdka.com", [], [], [] , [] , [] , [] , [] , [] , Image.asset('assets/images/logo/google.png')),
        new ForumModel(new UserModel("TestUser", "pm@oamsdka.com", [], [], [] , [] , [] , [] , [] , [] , Image.asset('assets/images/logo/google.png')), [], [], [], "Testforum", "forumDesc" , DateTime.now()),
        DateTime.now(), false, [] , [] , [] , Image.asset('assets/images/logo/google.png'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (contex, index) {
            return PostItem(post: posts[index]);
          }),
    );
  }
}
