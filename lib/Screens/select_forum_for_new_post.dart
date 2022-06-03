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
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close_rounded, size: 30,)),
                    SizedBox(width: 15,),
                    Text("Post to", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    Spacer(),
                    Container(
                      width: 80,
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
                              _selectedForum!.addPost(PostModel(postImage: widget.postImageFile!=null ? Image.file(widget.postImageFile!):null ,title: widget.title, desc: widget.desc, publisher: Datas().currentUser, forum: _selectedForum!, publishTime: DateTime.now(), upVotedUsers: [], downVotedUsers: [], comments: []));
                              Datas().updateFeed();
                              widget.feedSetState();
                              Navigator.of(context).popUntil((route) {
                                return route.settings.name == '/navigation_page';
                              });
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
                itemCount: Datas().forumsList.length,
                itemBuilder: (context, i){
                  return RadioListTile(
                    value: Datas().forumsList[i],
                    groupValue: _selectedForum,
                    onChanged: (value){
                      setState((){
                        _selectedForum=value as ForumModel?;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Colors.blue[700],
                    title: Text(Datas().forumsList[i].forumName),
                    subtitle: Text(Datas().forumsList[i].membersCount().toString() + (Datas().forumsList[i].membersCount()==1 ? " member":" members")),
                    secondary: CircleAvatar(
                      backgroundImage: Datas().forumsList[i].profileImage.image,
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