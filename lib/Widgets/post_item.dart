import '../libs.dart';

class PostItem extends StatefulWidget {
  PostModel post;

  PostItem({Key? key, required this.post}) : super(key: key);
  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: (Material(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage: widget.post.publisher.userProfileImage.image,
                    radius: 20,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "r/" + widget.post.forum.forumName,
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "u/" + widget.post.publisher.userName,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text('.'),
                          Text(DateTime.now()
                                  .difference(widget.post.publishTime)
                                  .inHours
                                  .toString() +
                              "h"),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: EdgeInsets.only(left: 20, bottom: 10, right: 20),
                  child: Text(
                    widget.post.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 20, bottom: 10, right: 20),
                    child: Text(widget.post.desc))),
            Container(
              child: widget.post.postImage,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState((){
                            if(widget.post.userDownVoted(Datas().currentUser)){ //deleting other vote
                              widget.post.downVotedUsers.remove(Datas().currentUser);
                            }
                            if(widget.post.userUpVoted(Datas().currentUser)) {
                              widget.post.upVotedUsers.remove(Datas().currentUser);
                            }
                            else{
                              widget.post.upVotedUsers.add(Datas().currentUser);
                            }
                          });
                        },
                        icon: Icon(
                          Icons.arrow_upward_rounded),
                          color: widget.post.userUpVoted(Datas().currentUser) ? Colors.green:Colors.black,
                        ),
                    Text(
                      (widget.post.anyVotes() ? widget.post.postScore().toString():"Vote"),
                      style: TextStyle(fontWeight: FontWeight.w500),),
                    IconButton(
                        onPressed: () {
                          setState((){
                            if(widget.post.userUpVoted(Datas().currentUser)){ //deleting other vote
                              widget.post.upVotedUsers.remove(Datas().currentUser);
                            }
                            if(widget.post.userDownVoted(Datas().currentUser)) {
                              widget.post.downVotedUsers.remove(Datas().currentUser);
                            }
                            else{
                              widget.post.downVotedUsers.add(Datas().currentUser);
                            }
                          });
                        },
                        icon: Icon(
                          Icons.arrow_downward_rounded,
                          color: widget.post.userDownVoted(Datas().currentUser) ? Colors.red:Colors.black,
                        ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.mode_comment_outlined), label: Text(/*post.comments.length.toString()*/ "0"),
                      style: TextButton.styleFrom(
                        primary: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          setState((){
                            if(Datas().currentUser.savedThisPost(widget.post)) {
                              Datas().currentUser.savedPosts.remove(widget.post);
                            }
                            else{
                              Datas().currentUser.savedPosts.add(widget.post);
                            }
                          });
                        },
                        icon: Icon(
                          Datas().currentUser.savedThisPost(widget.post) ? Icons.bookmark_rounded :Icons.bookmark_border_rounded,
                        ),
                        label: Text(
                            Datas().currentUser.savedThisPost(widget.post) ? "Saved!" : "Save",

                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.grey[900],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
