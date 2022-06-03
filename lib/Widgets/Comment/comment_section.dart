import '../../libs.dart';


class CommentSection extends StatefulWidget {
  PostModel post;
  SortType sortType;
  CommentSection({Key? key, required this.post, required this.sortType}) : super(key: key);

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {

  List<CommentModel> returnSortedBy(SortType sortType){

    List<CommentModel> sortedComments=widget.post.comments;
    if(sortType==SortType.best) {
      sortedComments.sort((a, b) =>
          b.commentScore().compareTo(a.commentScore()));
    }
    else{
      sortedComments.sort((a, b) =>
          b.publishTime.compareTo(a.publishTime));
    }
    return sortedComments;
  }

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
        children: [for(CommentModel comment in returnSortedBy(widget.sortType)) Comment(comment: comment)],
      )
    );
  }
}
