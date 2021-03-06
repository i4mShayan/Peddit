import '../libs.dart';

class PostItem extends StatefulWidget {
  PostModel post;
  Function pageSetState;
  bool inForumPage;
  PostItem({required this.post, required this.pageSetState, Key? key, this.inForumPage=false}) : super(key: key);
  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {

  String publishTimeAgo(){
    Duration diff=DateTime.now().difference(widget.post.publishTime);
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
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetails(post: widget.post,),
          ),
        ).then((value) => setState(() {}));
      },
      onDoubleTap: (){
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
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Material(
          child: (
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 10),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(user: widget.post.publisher),
                                ),
                              ).then((value) => setState(() {}));
                            },
                            child: CircleAvatar(
                              backgroundImage: widget.post.publisher.userProfileImage.image,
                              // backgroundColor: Colors.white,
                              radius: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: (widget.inForumPage ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "u/" + widget.post.publisher.userName,
                                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              Text(publishTimeAgo() +
                                  " ago", style: TextStyle(
                                  fontSize: 13,
                                  // color: Colors.grey,
                                  fontWeight: FontWeight.w400
                              ),),
                            ],
                          ): Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SingleForumPage(forum: widget.post.forum, pageSetState: ()=>setState((){}),)),
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Text(
                                      "r/" + widget.post.forum.forumName,
                                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "u/" + widget.post.publisher.userName,
                                    style: TextStyle(
                                        fontSize: 13,
                                        // color: Colors.grey[800],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.circle,
                                      size: 4,
                                      // color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    publishTimeAgo(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        // color: Colors.grey[600],
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          )) ,
                        ),
                        Spacer(),
                        PopupMenuButton(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(Icons.more_vert_rounded),
                          ),
                          itemBuilder: (context)=>[
                              PopupMenuItem(
                                enabled: userCanDeletePost(Datas().currentUser, widget.post),
                                  onTap: (){
                                    setState((){
                                      deletePost(widget.post);
                                      widget.pageSetState();
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete_rounded, size: 20, color: Colors.red,),
                                      SizedBox(width: 10,),
                                      Text(
                                        'Delete',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                        ),
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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.only(left: 15, bottom: 10, right: 20),
                          child: Text(widget.post.desc , maxLines: 3 , overflow: TextOverflow.ellipsis,))),
                  (widget.post.hasImage() ? Container(
                    child: widget.post.postImage,
                  ) :
                      SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState((){
                                widget.pageSetState();
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
                            color: widget.post.userUpVoted(Datas().currentUser) ? Colors.green:null,
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
                                widget.pageSetState();
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
                              color: widget.post.userDownVoted(Datas().currentUser) ? Colors.red:null,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostDetails(post: widget.post),
                                ),
                              );
                            },
                            icon: Icon(Icons.mode_comment_outlined), label: Text(widget.post.commentsCount.toString()),
                            style: TextButton.styleFrom(
                              // primary: Colors.grey[900],
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
                                  widget.pageSetState();
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
                                // primary: Colors.grey[900],
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
      ),
    );
  }
}