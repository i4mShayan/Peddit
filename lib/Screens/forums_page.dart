import '../libs.dart';

class ForumsPage extends StatefulWidget {
  const ForumsPage({Key? key}) : super(key: key);

  @override
  State<ForumsPage> createState() => _ForumsPageState();
}

class _ForumsPageState extends State<ForumsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: [
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
            ForumPreview(currentForum: DemoForumModel(),),
          ],
        ),
      ),
    );
  }
}