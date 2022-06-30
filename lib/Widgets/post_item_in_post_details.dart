import '../libs.dart';
import 'package:shamsi_date/shamsi_date.dart';

class PostItemInDetails extends StatefulWidget {
  PostModel post;
  PostItemInDetails({required this.post, Key? key}) : super(key: key);
  @override
  State<PostItemInDetails> createState() => _PostItemInDetailsState();
}

class _PostItemInDetailsState extends State<PostItemInDetails> {


  String shamsiDateOf(DateTime dateTime){
    final f = Jalali.fromDateTime(dateTime).formatter;
    return '${f.wN} ${f.d} ${f.mN} ${f.yyyy}';
  }

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
    return Container(
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
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(user: widget.post.publisher),
                                  ),
                                ).then((value) => setState(() {}));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
                                    child: CircleAvatar(
                                      backgroundImage: widget.post.publisher.userProfileImage.image,
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "u/" + widget.post.publisher.userName,
                                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                        ),
                                        Text(shamsiDateOf(widget.post.publishTime), style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuButton(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(Icons.more_vert_rounded),
                        ),
                        itemBuilder: (context)=>[
                          PopupMenuItem(
                              enabled: userCanDeletePost(CurrentUser().user, widget.post),
                              onTap: (){
                                setState((){
                                  deletePost(widget.post);
                                  Navigator.pop(context);
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
                              if(widget.post.userDownVoted(CurrentUser().user)){ //deleting other vote
                                widget.post.downVotedUsers.remove(CurrentUser().user);
                              }
                              if(widget.post.userUpVoted(CurrentUser().user)) {
                                widget.post.upVotedUsers.remove(CurrentUser().user);
                              }
                              else{
                                widget.post.upVotedUsers.add(CurrentUser().user);
                              }
                            });
                          },
                          icon: Icon(
                              Icons.arrow_upward_rounded),
                          color: widget.post.userUpVoted(CurrentUser().user) ? Colors.green:null,
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
                              if(widget.post.userUpVoted(CurrentUser().user)){ //deleting other vote
                                widget.post.upVotedUsers.remove(CurrentUser().user);
                              }
                              if(widget.post.userDownVoted(CurrentUser().user)) {
                                widget.post.downVotedUsers.remove(CurrentUser().user);
                              }
                              else{
                                widget.post.downVotedUsers.add(CurrentUser().user);
                              }
                            });
                          },
                          icon: Icon(
                            Icons.arrow_downward_rounded,
                            color: widget.post.userDownVoted(CurrentUser().user) ? Colors.red:null,
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
                                if(CurrentUser().user.savedThisPost(widget.post)) {
                                  CurrentUser().user.savedPosts.remove(widget.post);
                                }
                                else{
                                  CurrentUser().user.savedPosts.insert(0, widget.post);
                                }
                              });
                            },
                            icon: Icon(
                              CurrentUser().user.savedThisPost(widget.post) ? Icons.bookmark_rounded :Icons.bookmark_border_rounded,
                            ),
                            label: Text(
                              CurrentUser().user.savedThisPost(widget.post) ? "Saved!" : "Save",

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