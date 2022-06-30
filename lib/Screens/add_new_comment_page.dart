import '../libs.dart';

class AddNewCommentPage extends StatefulWidget {
  Function pageSetState;
  PostModel? replyingPost;
  CommentModel? replyingComment;
  AddNewCommentPage({Key? key, this.replyingPost=null, this.replyingComment=null, required this.pageSetState}) : super(key: key);

  @override
  State<AddNewCommentPage> createState() => _AddNewCommentPageState();
}

class _AddNewCommentPageState extends State<AddNewCommentPage> {


  String desc(){
    if(widget.replyingComment!=null){
      return widget.replyingComment!.commentDesc;
    }
    else if(widget.replyingPost!=null){
      return widget.replyingPost!.title;
    }
    else{
      return "unable to show this!";
    }
  }

  String title(){
    if(isReply()){
      return "Reply";
    }
    else{
      return "Add comment";
    }
  }

  bool isReply(){
    return widget.replyingComment != null;
  }


  bool canPostComment(){
    return _commentText.text.isNotEmpty;
  }

  late TextEditingController _commentText=TextEditingController();


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return Container(
      color: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close_rounded, size: 30,)),
                    SizedBox(width: 15,),
                    Text(title(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    Spacer(),
                    Container(
                      // width: 85,
                      margin: const EdgeInsets.only(right: 5,),
                      height: 40,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: (canPostComment() ? [Color(0xff374ABE), Colors.blue]:[Color(0xff374ABE).withOpacity(0.6), Colors.blue.withOpacity(0.6)]),
                        ),
                      ),
                      child: MaterialButton(
                        splashColor: canPostComment() ? null:Colors.transparent,
                        highlightColor: canPostComment() ? null:Colors.transparent,
                        onPressed: () {
                          if(canPostComment()) {
                            setState((){
                              CommentModel newComment = CommentModel(publisher: CurrentUser().user, publishTime: DateTime.now(), commentDesc: _commentText.text, upVotedUsers: [], downVotedUsers: [], repliedComments: []);
                              if(isReply()){
                                widget.replyingComment!.repliedComments.insert(0, newComment);
                              }
                              else{
                                widget.replyingPost!.comments.insert(0, newComment);
                              }
                              CurrentUser().user.commentsCount++;
                              widget.replyingPost!.commentsCount++;
                              widget.pageSetState();
                              Navigator.pop(context);
                            });
                          }
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          'Post',
                          style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
                child: Text(desc(),
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30 , left: 30),
                child: TextFormField(
                  autofocus:true,
                  onChanged: (value){
                    setState(() {});
                  },
                  controller: _commentText,
                  maxLines: 20,
                  minLines: 1,
                  cursorColor: Colors.grey[600],
                  style: TextStyle(
                      fontSize: 18
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none /*OutlineInputBorder()*/,
                    hintText: "Your comment",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
