import '../libs.dart';

class PostItemInDetails extends StatefulWidget {
  PostModel post;
  PostItemInDetails({required this.post, Key? key}) : super(key: key);
  @override
  State<PostItemInDetails> createState() => _PostItemInDetailsState();
}

class _PostItemInDetailsState extends State<PostItemInDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        child: (
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0, top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
                                  child: CircleAvatar(
                                    backgroundImage: widget.post.publisher.userProfileImage.image,
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "u/" + widget.post.publisher.userName,
                                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                    ),
                                    Text(DateTime.now()
                                        .difference(widget.post.publishTime)
                                        .inHours
                                        .toString() +
                                        " hours ago", style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 15, bottom: 5, right: 20),
                      child: Text(
                        widget.post.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, bottom: 10, right: 20),
                        child: Text(widget.post.desc , maxLines: 50 , overflow: TextOverflow.ellipsis,))),
                (widget.post.hasImage() ? Container(
                  child: widget.post.postImage,
                ) :
                SizedBox(height: 5,)),
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
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            (widget.post.anyVotes() ? widget.post.postScore().toString():"Vote"),
                            style: TextStyle(fontWeight: FontWeight.w500),),
                        ),
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
                        Icon(Icons.mode_comment_outlined),
                        SizedBox(width: 7,),
                        Text(
                          widget.post.commentsCount.toString(),
                          style: TextStyle(fontWeight: FontWeight.w500),
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
                                  Datas().currentUser.savedPosts.insert(0, widget.post);
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
            )
        ),
      ),
    );
  }
}