import '../libs.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false,

      // Feed Body(Posts)
      body: ListView.builder(
          itemCount: Datas().feedPosts.length,
          itemBuilder: (contex, index) {
            return PostItem(post: Datas().feedPosts[index]);
          }),
    );
  }
}
