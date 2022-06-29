import 'dart:convert';
import 'dart:io';

import '../libs.dart';
import 'package:flutter/services.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  late FeedPagePostsForCurrentUser postsFromServer;
  List<PostModel> posts=[];

  Future<void> _onRefresh() async {
    setState((){
      updatePostsList();
    });
  }

  Future<void> updatePostsList() async {
    await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
      socket.write("${Datas().currentUser.userName}/FeedPagePosts#\u0000");
      socket.flush();
      socket.listen((response) {
        String responseString = String.fromCharCodes(response);
        if(responseString == "UserDidNotfound") {
          print(responseString);
        }
        else {
          setState((){
            postsFromServer = FeedPagePostsForCurrentUser.fromJson(jsonDecode(responseString));
            posts=postsFromServer.posts;
          });
        }
      });
      socket.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
    resizeToAvoidBottomInset: false,
    body: RefreshIndicator(
      color: provider.isDarkMode ? Colors.white:Colors.black,
      onRefresh: _onRefresh,
      child: posts.length!=0 ? ListView.builder(
        itemCount: Datas().feedPosts.length,
        itemBuilder: (contex, index) {
          return InkWell(
            child: PostItem(post: posts[index], pageSetState: ()=>setState((){}),),
            onTap: (){
              PostModel post = posts[index];
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.dark,
              ));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetails(post: post),
                ),
              ).then((value) => setState(() {}));
            },
            onDoubleTap: (){
              PostModel post = posts[index];
              setState((){
                if(post.userDownVoted(Datas().currentUser)){ //deleting other vote
                  post.downVotedUsers.remove(Datas().currentUser);
                }
                if(post.userUpVoted(Datas().currentUser)) {
                  post.upVotedUsers.remove(Datas().currentUser);
                }
                else{
                  post.upVotedUsers.add(Datas().currentUser);
                }
              });
            },
          );
        })
        :
        ListView(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height -    // total height
                  kToolbarHeight -                      // top AppBar height
                  MediaQuery.of(context).padding.top -  // top padding
                  MediaQuery.of(context).padding.bottom - // bottom padding
                  kBottomNavigationBarHeight)/1.1,
              child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/gifs/empty_feed.gif", scale: 4,),
                  SizedBox(height: 7,),
                  Text("such empty!", style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Colors.grey[600],
                  ),),
                ],
              ),
          ),
            ),
        ]
        )
      )
    );
  }
}
