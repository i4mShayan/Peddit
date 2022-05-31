import '../../libs.dart';

class Comment extends StatefulWidget {
  CommentModel comment;
  Comment({required this.comment, Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 7),
      child: Material(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage: widget.comment.publisher.userProfileImage.image,
                    radius: 15,
                  ),
                ),
                Text(
                  "u/" + widget.comment.publisher.userName,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(Icons.circle , size: 4, color: Colors.grey[500],),
                ),
                Text(DateTime.now()
                    .difference(widget.comment.publishTime)
                    .inHours
                    .toString() +
                    "h", style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w400),),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5, top: 2),
                  child: Text(
                    widget.comment.commentDesc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 50,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PostDetails(post: widget.post),
                    //   ),
                    // );
                  },
                  icon: Icon(Icons.reply_rounded),
                  label: Text("Reply"),
                  style: TextButton.styleFrom(
                    primary: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 10,),
                IconButton(
                  onPressed: () {
                    setState((){
                      if(widget.comment.userDownVoted(Datas().currentUser)){ //deleting other vote
                        widget.comment.downVotedUsers.remove(Datas().currentUser);
                      }
                      if(widget.comment.userUpVoted(Datas().currentUser)) {
                        widget.comment.upVotedUsers.remove(Datas().currentUser);
                      }
                      else{
                        widget.comment.upVotedUsers.add(Datas().currentUser);
                      }
                    });
                  },
                  icon: Icon(
                      Icons.arrow_upward_rounded),
                  color: widget.comment.userUpVoted(Datas().currentUser) ? Colors.green:Colors.grey[600],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    (widget.comment.anyVotes() ? widget.comment.commentScore().toString():"Vote"),
                    style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[600],),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState((){
                      if(widget.comment.userUpVoted(Datas().currentUser)){ //deleting other vote
                        widget.comment.upVotedUsers.remove(Datas().currentUser);
                      }
                      if(widget.comment.userDownVoted(Datas().currentUser)) {
                        widget.comment.downVotedUsers.remove(Datas().currentUser);
                      }
                      else{
                        widget.comment.downVotedUsers.add(Datas().currentUser);
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_downward_rounded,
                    color: widget.comment.userDownVoted(Datas().currentUser) ? Colors.red:Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
