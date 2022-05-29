import '../libs.dart';

class SavedPostsPage extends StatefulWidget {
  const SavedPostsPage({Key? key}) : super(key: key);

  @override
  State<SavedPostsPage> createState() => _SavedPostsPageState();
}

class _SavedPostsPageState extends State<SavedPostsPage> {

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

      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (contex, index) {
            return PostItem(post: posts[index]);
          }),
    );
  }
}
