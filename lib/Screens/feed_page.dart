import '../libs.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {


  List<PostModel> posts = [
    PostModel(title: "title", desc: "dec",
      publisher: UserModel(userName: "user", email: "email", userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: []),
      forum: ForumModel(owner: UserModel(userName: "user", email: "email", userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], ),
          forumCreateTime: DateTime.now(), profileImage: Datas().defaultProfilePicture),
      publishTime: DateTime.now(), hasImage: true, postImage: Datas().defaultBackground, upVotedUsers: [], downVotedUsers: [],),
    PostModel(title: "title", desc: "dec",
      publisher: UserModel(userName: "user", email: "email", userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: []),
      forum: ForumModel(owner: UserModel(userName: "user", email: "email", userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], ),
          forumCreateTime: DateTime.now(), profileImage: Datas().defaultProfilePicture),
      publishTime: DateTime.now(), hasImage: true, postImage: Datas().defaultBackground, downVotedUsers: [], upVotedUsers: [],),
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
