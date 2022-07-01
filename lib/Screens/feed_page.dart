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

  Future<void> _onRefresh() async {
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
    resizeToAvoidBottomInset: false,
    body: RefreshIndicator(
      color: provider.isDarkMode ? Colors.white:Colors.black,
      onRefresh: _onRefresh,
      child: AppDatas().feedPosts.length!=0 ? ListView.builder(
        itemCount: AppDatas().feedPosts.length,
        itemBuilder: (contex, index) {
          return InkWell(
            child: PostItem(post: AppDatas().feedPosts[index], pageSetState: ()=>setState((){}),),
            onTap: (){
              PostModel post = AppDatas().feedPosts[index];
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
              PostModel post = AppDatas().feedPosts[index];
              setState((){
                if(post.userDownVoted(CurrentUser().user)){ //deleting other vote
                  post.downVotedUsers.remove(CurrentUser().user);
                }
                if(post.userUpVoted(CurrentUser().user)) {
                  post.upVotedUsers.remove(CurrentUser().user);
                }
                else{
                  post.upVotedUsers.add(CurrentUser().user);
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
