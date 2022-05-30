import '../libs.dart';
import 'package:flutter/services.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      resizeToAvoidBottomInset: false,

      // Feed Body(Posts)
      body: ListView.builder(
          itemCount: Datas().feedPosts.length,
          itemBuilder: (contex, index) {
            return InkWell(
              child: PostItem(post: Datas().feedPosts[index]),
              onTap: (){
                PostModel post = Datas().feedPosts[index];
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
                PostModel post = Datas().feedPosts[index];
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
          }),
    );
  }
}
