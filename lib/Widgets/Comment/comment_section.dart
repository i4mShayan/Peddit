import '../../libs.dart';


class CommentSection extends StatefulWidget {
  PostModel post;
  CommentSection({Key? key, required this.post}) : super(key: key);

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override
  Widget build(BuildContext context) {
    return (widget.post.comments.length==0 ?
      Column(
        children: [
          Icon(Icons.emoji_emotions_rounded, color: Colors.grey[600]!.withOpacity(0.5), size: 100,),
          Text("Be the first person who comments!", style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.grey[600],
          ),),
        ],
      )
        :
      Column(
        children: [for(CommentModel comment in widget.post.comments) Comment(comment: comment)],
      )
    );
  }
}
