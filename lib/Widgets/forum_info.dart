import '../libs.dart';

class ForumInfo extends StatefulWidget {
  ForumModel forum;
  ForumInfo({Key? key, required this.forum}) : super(key: key);

  @override
  State<ForumInfo> createState() => _ForumInfoState();
}

class _ForumInfoState extends State<ForumInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            widget.forum.forumDesc,
            style: TextStyle(fontSize: 20),
            // overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
