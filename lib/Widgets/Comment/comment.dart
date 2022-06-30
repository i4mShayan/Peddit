import '../../libs.dart';

class Comment extends StatefulWidget {
  CommentModel comment;
  PostModel post;
  bool isReply;
  double dividerThickness;
  Comment({required this.comment, required this.post, this.isReply=false, this.dividerThickness=1, Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  String publishTimeAgo(){
    Duration diff=DateTime.now().difference(widget.comment.publishTime);
    if(diff.inDays <= 1){
      if(diff.inHours<1){
        if(diff.inMinutes<1){
          return diff.inSeconds.toString() + "s";
        }
        return diff.inMinutes.toString() + "m";
      }
      return diff.inHours.toString() + "h";
    }
    return diff.inDays.toString() + "days";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.isReply ? 0:10),
      child: Material(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage:
                        widget.comment.publisher.userProfileImage.image,
                    backgroundColor: Colors.white,
                    radius: 15,
                  ),
                ),
                Text(
                  "u/" + widget.comment.publisher.userName,
                  style: TextStyle(
                      fontSize: 14,
                      // color: Colors.grey[700],
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.circle,
                    size: 4,
                    // color: Colors.grey[500],
                  ),
                ),
                Text(
                  publishTimeAgo(),
                  style: TextStyle(
                      fontSize: 13,
                      // color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Container(
                  //   margin: EdgeInsets.only(left: 20),
                  //   child: const VerticalDivider(
                  //     width: 1,
                  //     thickness: 1,
                  //     // indent: 20,
                  //     endIndent: 0,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  Expanded(
                    child: Column(
                      children: [
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
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        AddNewCommentPage(pageSetState: ()=>setState((){}),
                                          replyingComment: widget.comment,
                                          replyingPost: widget.post,
                                        ),
                                ));
                              },
                              icon: Icon(Icons.reply_rounded),
                              label: Text("Reply"),
                              style: TextButton.styleFrom(
                                // primary: Colors.grey[600],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (widget.comment.userDownVoted(CurrentUser().user)) {
                                    //deleting other vote
                                    widget.comment.downVotedUsers
                                        .remove(CurrentUser().user);
                                  }
                                  if (widget.comment.userUpVoted(CurrentUser().user)) {
                                    widget.comment.upVotedUsers.remove(CurrentUser().user);
                                  } else {
                                    widget.comment.upVotedUsers.add(CurrentUser().user);
                                  }
                                });
                              },
                              icon: Icon(Icons.arrow_upward_rounded),
                              color: widget.comment.userUpVoted(CurrentUser().user)
                                  ? Colors.green
                                  : null,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                (widget.comment.anyVotes()
                                    ? widget.comment.commentScore().toString()
                                    : "Vote"),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  // color: Colors.grey[600],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (widget.comment.userUpVoted(CurrentUser().user)) {
                                    //deleting other vote
                                    widget.comment.upVotedUsers.remove(CurrentUser().user);
                                  }
                                  if (widget.comment.userDownVoted(CurrentUser().user)) {
                                    widget.comment.downVotedUsers
                                        .remove(CurrentUser().user);
                                  } else {
                                    widget.comment.downVotedUsers.add(CurrentUser().user);
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.arrow_downward_rounded,
                                color: widget.comment.userDownVoted(CurrentUser().user)
                                    ? Colors.red
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // widget.comment.repliedComments.isNotEmpty ? Column(
            //     children: [for(CommentModel comment in widget.comment.repliedComments) Comment(comment: comment)]
            // ) : SizedBox(),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 0),
                    child: VerticalDivider(
                      width: 0.8 + widget.dividerThickness/4,
                      thickness: widget.dividerThickness,
                      // indent: 20,
                      endIndent: 5,
                      color: Colors.grey,
                    ),
                  ),
                  // SizedBox(
                  //   child: const VerticalDivider(
                  //     width: 20,
                  //     thickness: 1,
                  //     indent: 20,
                  //     endIndent: 0,
                  //     color: Colors.grey,
                  //   ),
                  //   width: MediaQuery.of(context).size.width / 10,
                  // ),
                  widget.comment.repliedComments.length != 0
                      ? Expanded(
                          child: Column(children: [
                            for (CommentModel comment
                                in widget.comment.repliedComments)
                              Comment(comment: comment, isReply: true, dividerThickness: widget.dividerThickness+1, post: widget.post,)
                          ]),
                        )
                      : SizedBox(),
                  //     Expanded(
                  //         child:
                  //       Column(
                  //       children: [
                  //         Container(
                  //           height: 10,
                  //           color: Colors.red,
                  //         ),
                  //         Container(
                  //           height: 5,
                  //           color: Colors.blue,
                  //         ),
                  //         Container(
                  //           height: 5,
                  //           color: Colors.orange,
                  //         ),
                  //       ],
                  //       ),
                  //     ),
                  //     widget.comment.repliedComments != null ? ListView.builder(
                  //         itemCount: widget.comment.repliedComments?.length,
                  //         itemBuilder: (contex, index) {
                  //           return Comment(
                  //             comment: widget.comment.repliedComments![index],
                  //           );
                  //         }) : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
