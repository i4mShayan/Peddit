import '../libs.dart';

class SavedPostsPage extends StatefulWidget {
  const SavedPostsPage({Key? key}) : super(key: key);

  @override
  State<SavedPostsPage> createState() => _SavedPostsPageState();
}

class _SavedPostsPageState extends State<SavedPostsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      resizeToAvoidBottomInset: false,

      body: ListView.builder(
          itemCount: Datas().currentUser.savedPosts.length,
          itemBuilder: (contex, index) {
            return PostItem(post: Datas().currentUser.savedPosts[index]);
          }),
    );
  }
}
