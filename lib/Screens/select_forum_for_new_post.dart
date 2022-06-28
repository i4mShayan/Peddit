import 'dart:io';
import '../libs.dart';

class SelectForumForNewPost extends StatefulWidget {
  String title, desc;
  File? postImageFile;
  Function feedSetState;
  SelectForumForNewPost({Key? key, required this.title, required this.desc, required this.postImageFile, required this.feedSetState}) : super(key: key);

  @override
  State<SelectForumForNewPost> createState() => _SelectForumForNewPostState();
}

class _SelectForumForNewPostState extends State<SelectForumForNewPost> {


  ForumModel? _selectedForum;

  bool canCreatePost(){
    return _selectedForum!=null;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    List<ForumModel> notBlockedForums=[];
    notBlockedForums.addAll(Datas().currentUser.followedForums);
    notBlockedForums.removeWhere((forum) => forum.blockedUsers.contains(Datas().currentUser));
    return Container(
      color: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_rounded, size: 30,)),
                    SizedBox(width: 15,),
                    Text("Post to", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
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
                          colors: (canCreatePost() ? [Color(0xff374ABE), Colors.blue]:[Color(0xff374ABE).withOpacity(0.6), Colors.blue.withOpacity(0.6)]),
                        ),
                      ),
                      child: MaterialButton(
                        splashColor: canCreatePost() ? null:Colors.transparent,
                        highlightColor: canCreatePost() ? null:Colors.transparent,
                        onPressed: () {
                          if(canCreatePost()) {
                            setState((){
                              PostModel newPost = PostModel(postImage: widget.postImageFile!=null ? Image.file(widget.postImageFile!):null ,title: widget.title, desc: widget.desc, publisher: Datas().currentUser, forum: _selectedForum!, publishTime: DateTime.now(), upVotedUsers: [], downVotedUsers: [], comments: [], commentsCount: 0);
                              _selectedForum!.addPost(newPost);
                              Datas().currentUser.userPostsCount++;
                              Datas().updateFeed();
                              widget.feedSetState();
                              Navigator.of(context).popUntil((route) {
                                return route.settings.name == '/navigation_page';
                              });
                              SnackBar snackBar = SnackBar(
                                backgroundColor: Colors.green,
                                content: Flexible(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.emoji_emotions_outlined, color: Colors.white),
                                      SizedBox(width: 10,),
                                      Text('Posted in r/', style: TextStyle(color: Colors.white),),
                                      Text(_selectedForum!.forumName, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),),
                                      Spacer(),
                                      Icon(Icons.check, color: Colors.white)
                                    ],
                                  ),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              SizedBox(height: 7,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: notBlockedForums.length,
                itemBuilder: (context, i){
                  return RadioListTile(
                    value: notBlockedForums[i],
                    groupValue: _selectedForum,
                    onChanged: (value){
                      setState((){
                        _selectedForum=value as ForumModel?;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Colors.blue[700],
                    title: Text(notBlockedForums[i].forumName),
                    subtitle: Text(notBlockedForums[i].membersCount().toString() + (notBlockedForums[i].membersCount()==1 ? " member":" members")),
                    secondary: CircleAvatar(
                      backgroundImage: notBlockedForums[i].profileImage.image,
                      backgroundColor: Colors.white,
                      // radius: 15,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
