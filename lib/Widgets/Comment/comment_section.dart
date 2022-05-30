import '../../libs.dart';


class CommentSection extends StatefulWidget {
  const CommentSection({Key? key}) : super(key: key);

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Comment(comment: CommentModel(publisher: Datas().currentUser,
            post: Datas().feedPosts[0], forum: Datas().forumsList[0], time: DateTime.now(),
            commentDesc: "hello!", likedUsers: [],
            disLikedUsers: [], usersReplied: []),),
      ],
    );
  }
}
